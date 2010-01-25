class Product < ActiveRecord::Base
  belongs_to :category
  validates_numericality_of :price
end
