class CitiesController < ApplicationController
  def index
    @cities = City.all
  end
  
  def show
    @city = City.find(params[:id])
  end
  
  def new
    @city = City.new
  end
  
  def create
    @city = City.new(params[:city])
    if @city.save
      Stalker.enqueue("city.fetch_name", :id => @city.id)
      flash[:notice] = "Successfully created city."
      redirect_to @city
    else
      render :action => 'new'
    end
  end
  
  def edit
    @city = City.find(params[:id])
  end
  
  def update
    @city = City.find(params[:id])
    if @city.update_attributes(params[:city])
      flash[:notice] = "Successfully updated city."
      redirect_to @city
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    flash[:notice] = "Successfully destroyed city."
    redirect_to cities_url
  end
end
