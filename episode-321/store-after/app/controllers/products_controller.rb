class ProductsController < ApplicationController
  def index
    @products = Product.scoped
    fresh_when last_modified: @products.maximum(:updated_at)
  end

  def show
    @product = Product.find(params[:id])
    expires_in 5.minutes
    fresh_when @product, public: true
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to @product, notice: "Successfully created product."
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product, notice: "Successfully created product."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Successfully destroyed product."
  end
end
