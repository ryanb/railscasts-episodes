class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations
  validates_presence_of :name, :price
end
