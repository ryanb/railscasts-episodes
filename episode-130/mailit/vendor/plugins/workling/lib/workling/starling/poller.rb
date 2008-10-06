require 'workling/starling'

module Workling
  module Starling
    
    class Poller
      
      cattr_accessor :sleep_time # Seconds to sleep before looping
      cattr_accessor :reset_time # Seconds to wait while resetting connection

      def initialize(routing)
        Poller.sleep_time = Workling::Starling.config[:sleep_time] || 2
        Poller.reset_time = Workling::Starling.config[:reset_time] || 30
          
        @routing = routing
        @workers = ThreadGroup.new
      end      
      
      def logger
        Workling::Base.logger
      end
    
      def listen
                
        # Allow concurrency for our tasks
        ActiveRecord::Base.allow_concurrency = true

        # Create a thread for each worker.
        Workling::Discovery.discovered.each do |clazz|
          logger.debug("Discovered listener #{clazz}")
          @workers.add(Thread.new(clazz) { |c| clazz_listen(c) })
        end
        
        # Wait for all workers to complete
        @workers.list.each { |t| t.join }

        # Clean up all the connections.
        ActiveRecord::Base.verify_active_connections!
      end
      
      # gracefully stop processing
      def stop
        @workers.list.each { |w| w[:shutdown] = true }
      end
      
      ##
      ## Thread procs
      ##
      
      # Listen for one worker class
      def clazz_listen(clazz)
        
        logger.debug("Listener thread #{clazz.name} started")
           
        # Read thread configuration if available
        if Starling.config.has_key?(:listeners)
          if Starling.config[:listeners].has_key?(clazz.to_s)
            config = Starling.config[:listeners][clazz.to_s].symbolize_keys
            thread_sleep_time = config[:sleep_time] if config.has_key?(:sleep_time)
          end
        end

        hread_sleep_time ||= self.class.sleep_time
                
        # Setup connection to starling (one per thread)
        connection = Workling::Starling::Client.new
        puts "** Starting Workling::Starling::Client for #{clazz.name} queue"
        
        # Start dispatching those messages
        while (!Thread.current[:shutdown]) do
          begin
            
            # Keep MySQL connection alive
            unless ActiveRecord::Base.connection.active?
              unless ActiveRecord::Base.connection.reconnect!
                logger.fatal("FAILED - Database not available")
                break
              end
            end

            # Dispatch and process the messages
            n = dispatch!(connection, clazz)
            logger.debug("Listener thread #{clazz.name} processed #{n.to_s} queue items") if n > 0
            sleep(self.class.sleep_time) unless n > 0
            
            # If there is a memcache error, hang for a bit to give it a chance to fire up again
            # and reset the connection.
            rescue MemCache::MemCacheError
              logger.warn("Listener thread #{clazz.name} failed to connect to memcache. Resetting connection.")
              sleep(self.class.reset_time)
              connection.reset
          end
        end
        
        logger.debug("Listener thread #{clazz.name} ended")
      end
      
      # Dispatcher for one worker class. Will throw MemCacheError if unable to connect.
      # Returns the number of worker methods called
      def dispatch!(connection, clazz)
        n = 0
        for queue in @routing.queue_names_routing_class(clazz)
          begin
            result = connection.get(queue)
            if result
              n += 1
              handler = @routing[queue]
              method_name = @routing.method_name(queue)
              logger.debug("Calling #{handler.class.to_s}\##{method_name}(#{result.inspect})")
              handler.send(method_name, result)
            end
          rescue MemCache::MemCacheError => e
            logger.error("FAILED to connect with queue #{ queue }: #{ e } }")
            raise e
          rescue Object => e
            logger.error("FAILED to process queue #{ queue }. #{ @routing[queue] } could not handle invocation of #{ @routing.method_name(queue) } with #{ result.inspect }: #{ e }.\n#{ e.backtrace.join("\n") }")
          end
        end
        
        return n
      end
    end
  end
end
