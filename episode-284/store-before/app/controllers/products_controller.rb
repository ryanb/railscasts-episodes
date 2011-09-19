class ProductsController < ApplicationController
  def index
    @products = Product.order("released_at desc")
  end

  def show
    @product = Product.find(params[:id])
  end
end
