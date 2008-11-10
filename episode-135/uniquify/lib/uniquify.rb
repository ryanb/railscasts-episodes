module Uniquify
  def self.included(base)
    base.extend ClassMethods
  end
  
  def ensure_unique(name)
    begin
      self[name] = yield
    end while self.class.exists?(name => self[name])
  end
  
  module ClassMethods
    
    def uniquify(*args, &block)
      options = { :length => 8, :chars => ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a }
      options.merge!(args.pop) if args.last.kind_of? Hash
      args.each do |name|
        before_create do |record|
          if block
            record.ensure_unique(name, &block)
          else
            record.ensure_unique(name) do
              Array.new(options[:length]) { options[:chars].to_a[rand(options[:chars].to_a.size)] }.join
            end
          end
        end
      end
    end
    
  end
end

class ActiveRecord::Base
  include Uniquify
end
