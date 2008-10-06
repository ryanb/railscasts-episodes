require 'workling/remote/runners/base'

module Workling
  module Remote
    module Runners
      class StarlingRunner < Workling::Remote::Runners::Base
        cattr_accessor :routing
        cattr_accessor :client
        
        def initialize
          StarlingRunner.client = Workling::Starling::Client.new
          StarlingRunner.routing = Workling::Starling::Routing::ClassAndMethodRouting.new
        end
        
        def run(clazz, method, options = {})
          StarlingRunner.client.set(@@routing.queue_for(clazz, method), options)
          
          return nil # empty.
          
          rescue MemCache::MemCacheError => e
            # failed to enqueue, raise a workling error so that it propagates upwards
            raise Workling::WorklingError.new("#{e.class.to_s} - #{e.message}")
        end
      end
    end
  end
end