class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @authors.tokens(params[:q]) }
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to @author, notice: "Successfully created author."
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to @author, notice: "Successfully updated author."
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url, notice: "Successfully destroyed author."
  end
end
