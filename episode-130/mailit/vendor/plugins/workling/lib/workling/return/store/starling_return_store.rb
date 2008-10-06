require 'workling/return/store/base'
require 'workling/starling/client'

module Workling
  module Return
    module Store
      class StarlingReturnStore < Base
        cattr_accessor :client
        
        def initialize
          self.client = Workling::Starling::Client.new
        end
        
        def set(key, value)
          self.class.client.set(key, value)
        end
        
        def get(key)
          self.class.client.get(key)
        end
      end
    end
  end
end