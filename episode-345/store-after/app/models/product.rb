class Product < ActiveRecord::Base
  attr_accessible :name, :category, :price, :description
  validates_numericality_of :runtime, allow_blank: true
  
  %w[author rating runtime].each do |key|
    attr_accessible key
    scope "has_#{key}", lambda { |value| where("properties @> (? => ?)", key, value) }
    
    define_method(key) do
      properties && properties[key]
    end
  
    define_method("#{key}=") do |value|
      self.properties = (properties || {}).merge(key => value)
    end
  end
end
