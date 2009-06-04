class Product < ActiveRecord::Base
  belongs_to :category
  
  def price_modification
    price
  end
  
  def price_modification=(new_price)
    if new_price.to_s.ends_with? "%"
      self.price += (price * (new_price.to_f/100)).round(2)
    else
      self.price = new_price
    end
  end
end
