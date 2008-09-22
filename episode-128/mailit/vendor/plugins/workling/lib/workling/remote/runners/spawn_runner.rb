require 'workling/remote/runners/base'

module Workling
  module Remote
    module Runners
      class SpawnRunner < Workling::Remote::Runners::Base
        cattr_accessor :options
        @@options = { :method => :fork }
        include ::Spawn
        
        def run(clazz, method, options = {})
          spawn(SpawnRunner.options) do
            worker_instance(clazz).send(method, options)
          end
          
          return nil # that means nothing!
        end
      end
    end
  end
end