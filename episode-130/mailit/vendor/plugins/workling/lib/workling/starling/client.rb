require 'workling/starling'

module Workling
  module Starling
    class Client
      attr_accessor :starling_url
      attr_accessor :connection
      
      def initialize
        @starling_url = Workling::Starling.config[:listens_on]
        options = [self.starling_url, Workling::Starling.config[:memcache_options]].compact
        @connection = ::MemCache.new(*options)
      end
      
      def method_missing(method, *args)
        @connection.send(method, *args)
      end
      
      def stats
        @connection.stats
      end
    end
  end
end