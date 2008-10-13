class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :through => :cart_items
  
  def total_price
    cart_items.to_a.sum(&:full_price)
  end
end
