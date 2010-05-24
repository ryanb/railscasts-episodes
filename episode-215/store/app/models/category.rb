class Category < ActiveRecord::Base
  has_many :products
  scope :with_cheap_products, joins(:products) & Product.cheap
end
