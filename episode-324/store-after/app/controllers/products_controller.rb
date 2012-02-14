class ProductsController < ApplicationController
  def index
    gon.rabl "app/views/products/index.json.rabl", as: "products"
  end
end
