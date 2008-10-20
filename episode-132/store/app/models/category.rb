class Category < ActiveRecord::Base
  has_many :products
  
  def description
    "This category has #{helpers.pluralize(products.count, 'product')}."
  end
  
  def helpers
    ActionController::Base.helpers
  end
end
