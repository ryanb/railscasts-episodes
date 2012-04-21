class Product < ActiveRecord::Base
  attr_accessible :name, :category, :price, :description
end
