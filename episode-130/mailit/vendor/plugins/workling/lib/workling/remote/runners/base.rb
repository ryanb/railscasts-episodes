module Workling
  module Remote
    module Runners
      class Base
        def worker_instance(clazz, method = nil)
          begin
            inst = clazz.to_s.camelize.constantize.new 
          rescue NameError
            raise_not_found(clazz, method)
          end
          raise_not_found(clazz, method) if method && !inst.respond_to?(method)
          inst
        end
                
        def logger
          Workling::Base.logger
        end
        
        private
        def raise_not_found(clazz, method)
          raise Workling::WorklingNotFoundError.new("could not find #{ clazz }:#{ method } workling. ") 
        end
        
        # internal template method takes care of suppressing remote errors but raising Workling::WorklingNotFoundError
        # where appropriate. swallow workling exceptions so that this behaves like remote code.
        # otherwise StarlingRunner and SpawnRunner would behave too differently to NotRemoteRunner.
        def run_with_error_handling(clazz, method, options = {})
          begin 
            self.run(clazz, method, options)
          rescue Exception => e
            raise e if e.kind_of? Workling::WorklingError
            logger.error "WORKLING: runner could not invoke #{ clazz }:#{ method } with #{ options.inspect }. error was: #{ e.inspect }"
          end
        end
      end
    end
  end
end
