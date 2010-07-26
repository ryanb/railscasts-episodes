class ProductsController < ApplicationController
  respond_to :html, :xml
  
  def index
    @products = Product.all
    respond_with(@products)
  end
  
  def show
    @product = Product.find(params[:id])
    respond_with(@product)
  end
  
  def new
    @product = Product.new
    respond_with(@product)
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      cookies.permanent[:last_product_id] = @product.id
      flash[:notice] = "Successfully created product."
    end
    respond_with(@product)
  end
  
  def edit
    @product = Product.find(params[:id])
    respond_with(@product) do |format|
      format.xml { render :text => "I'm XML!" }
    end
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
    end
    respond_with(@product, :location => products_url)
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    respond_with(@product, :responder => MyResponder)
  end
end
