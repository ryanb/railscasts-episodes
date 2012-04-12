class ProductsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: ProductsDatatable.new(view_context) }
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
