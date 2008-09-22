require 'workling/starling/routing/base'

module Workling
  module Starling
    module Routing
      class ClassAndMethodRouting < Base
            
        def initialize
          super

          build
        end
        
        def method_name(queue)
          queue.split("__").last
        end
        
        def queue_for(clazz, method)
          ClassAndMethodRouting.queue_for(clazz, method)
        end
                
        def self.queue_for(clazz, method)
          "#{ clazz.to_s.tableize }/#{ method }".split("/").join("__") # Don't split with : because it messes up memcache stats
        end
        
        def queue_names
          self.keys
        end
        
        def queue_names_routing_class(clazz)
          self.select { |x, y|  y.is_a?(clazz) }.map { |x, y| x }
        end
        
        private
          def build
            Workling::Discovery.discovered.each do |clazz|
              methods = clazz.instance_methods(false)
              methods.each do |method|
                next if method == 'create'  # Skip the create method
                queue =  queue_for(clazz, method)
                self[queue] = clazz.new
              end   
            end     
          end       
      end
    end
  end
end