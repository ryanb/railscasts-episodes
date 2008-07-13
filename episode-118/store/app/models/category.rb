class Category < ActiveRecord::Base
  has_many :products
  liquid_methods :name
end
