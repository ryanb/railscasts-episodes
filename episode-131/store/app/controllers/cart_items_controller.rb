class CartItemsController < ApplicationController
  def create
    current_cart.cart_items.create!(params[:cart_item])
    flash[:notice] = "Product added to cart"
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
    redirect_to current_cart_url
  end
end
