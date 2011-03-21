class AuthorsController < ApplicationController
  def index
    @authors = Author.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @authors.map(&:attributes) }
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
      redirect_to @author, :notice => "Successfully created author."
    else
      render :action => 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to @author, :notice  => "Successfully updated author."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url, :notice => "Successfully destroyed author."
  end
end
