class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on, :category_id, :rating, :discontinued
  belongs_to :category
  validates_presence_of :name, :price
end
