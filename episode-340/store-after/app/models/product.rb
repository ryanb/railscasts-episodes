class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on, :category
end
