class TasksController < ApplicationController
  def new
    @task = Task.new(:project_id => params[:project_id])
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = "Successfully created task."
      redirect_to @task.project
    else
      render :action => 'new'
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Successfully updated task."
      redirect_to @task.project
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Successfully destroyed task."
    redirect_to @task.project
  end
end
