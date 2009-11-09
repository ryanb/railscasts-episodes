class Product < ActiveRecord::Base
  belongs_to :category
  
  def validate
    if price < 0
      errors.add :price, "cannot be negative"
    end
  end
end
