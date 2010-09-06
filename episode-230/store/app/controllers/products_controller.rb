class ProductsController < InheritedResources::Base
  respond_to :html, :xml
  has_scope :limit, :default => 8
  
  def create
    create! { products_path }
  end
end
