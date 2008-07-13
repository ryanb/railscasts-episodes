class Page < ActiveRecord::Base
  liquid_methods :products
  
  def products
    Product.all
  end
end
