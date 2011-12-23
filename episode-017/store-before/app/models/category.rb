class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :products, through: :categorizations
end
