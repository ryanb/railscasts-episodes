require 'workling/base'

module Analytics
  class Invites < ::Workling::Base
    
    def sent(*args)
      p "nice"
    end
  end
end