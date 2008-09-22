module Workling
  module Return
    module Store
      mattr_accessor :instance
      
      def self.set(key, value)
        self.instance.set(key, value)
      end
      
      def self.get(key)
        self.instance.get(key)
      end
      
      class Base
        def set(key, value)
          raise NotImplementedError.new("put(key, value) not implemented in #{ self.class }")
        end
        
        def get(key)
          raise NotImplementedError.new("get(key) not implemented in #{ self.class }")
        end
      end
    end
  end
end