class Product < ActiveRecord::Base
  belongs_to :publisher
  has_many :categorizations
  has_many :categories, through: :categorizations
end
