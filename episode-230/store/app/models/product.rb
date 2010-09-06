class Product < ActiveRecord::Base
  attr_accessible :name, :price, :discontinued_at
  has_many :reviews
end
