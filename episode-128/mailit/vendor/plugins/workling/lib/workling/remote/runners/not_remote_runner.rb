require 'workling/remote/runners/base'

module Workling
  module Remote
    module Runners
      class NotRemoteRunner < Workling::Remote::Runners::Base
        def run(clazz, method, options = {})
          workling = worker_instance(clazz, method)
          workling.send(method, Marshal.load(Marshal.dump(options)))
          
          return nil # nada. niente.
        end
      end
    end
  end
end
