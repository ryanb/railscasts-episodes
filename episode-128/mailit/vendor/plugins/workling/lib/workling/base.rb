module Workling
  class Base
    cattr_accessor :logger
    @@logger ||= ::RAILS_DEFAULT_LOGGER
    
    def self.inherited(subclass)
      Workling::Discovery.discovered << subclass
    end
    
    def initialize
      super
      
      create
    end

    def create
      # Put worker initialize code in here. This is good for restarting jobs that
      # were interrupted.
    end
  
    # thanks to blaine cook for this suggestion.
    def self.method_missing(method, *args, &block)
      if method.to_s =~ /^asynch?_(.*)/
        Workling::Remote.run(self.to_s.dasherize, $1, *args)
      else
        super
      end
    end
  end
end