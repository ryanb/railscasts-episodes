class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end
  
  def show
    @problem = Problem.find(params[:id])
  end
  
  def new
    @problem = Problem.new
  end
  
  def create
    @problem = Problem.new(params[:problem])
    if @problem.save
      flash[:notice] = "Successfully created problem."
      redirect_to @problem
    else
      render :action => 'new'
    end
  end
  
  def edit
    @problem = Problem.find(params[:id])
  end
  
  def update
    @problem = Problem.find(params[:id])
    if @problem.update_attributes(params[:problem])
      flash[:notice] = "Successfully updated problem."
      redirect_to @problem
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    flash[:notice] = "Successfully destroyed problem."
    redirect_to problems_url
  end
end
