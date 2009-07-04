class ForumsController < ApplicationController
  before_filter :admin_required, :except => [:index, :show]
  
  def index
    @forums = Forum.all
  end
  
  def show
    @forum = Forum.find(params[:id])
  end
  
  def new
    @forum = Forum.new
  end
  
  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      flash[:notice] = "Successfully created forum."
      redirect_to @forum
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      flash[:notice] = "Successfully updated forum."
      redirect_to @forum
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    flash[:notice] = "Successfully destroyed forum."
    redirect_to forums_url
  end
end
