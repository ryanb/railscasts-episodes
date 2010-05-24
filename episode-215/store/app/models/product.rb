class Product < ActiveRecord::Base
  belongs_to :category
  scope :discontinued, where(:discontinued => true)

  def self.cheaper_than(price)
    where("products.price < ?", price)
  end
  
  scope :cheap, cheaper_than(5)
end
