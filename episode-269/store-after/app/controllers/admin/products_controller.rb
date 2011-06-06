module Admin
  class ProductsController < BaseController
    def index
      @products = Product.all
    end

    def show
      @product = Product.find(params[:id])
    end

    def new
      @product = Product.new
    end

    def edit
      @product = Product.find(params[:id])
    end

    def create
      @product = Product.new(params[:product])
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render action: "new"
      end
    end

    def update
      @product = Product.find(params[:id])
      if @product.update_attributes(params[:product])
        redirect_to [:admin, @product], notice: 'Product was successfully updated.'
      else
        render action: "edit"
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_url
    end
  end
end
