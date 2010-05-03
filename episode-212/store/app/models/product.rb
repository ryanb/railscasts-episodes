class Product < ActiveRecord::Base
  belongs_to :category
  
  def self.search(params)
    products = scope_builder
    products.where("name like ?", "%" + params[:name] + "%") if params[:name]
    products.where("price >= ?", params[:price_gt]) if params[:price_gt]
    products.where("price <= ?", params[:price_lt]) if params[:price_lt]
    products
  end
  
  def self.scope_builder
    DynamicDelegator.new(scoped)
  end
end
