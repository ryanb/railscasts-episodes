class Product < ActiveRecord::Base
  belongs_to :category
  liquid_methods :name, :price, :category
end
