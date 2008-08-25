class TasksController < ApplicationController
  before_filter :login_required
  
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
    @task = current_user.tasks.find(params[:id])
  end
  
  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Successfully updated task."
      redirect_to @task.project
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    flash[:notice] = "Successfully destroyed task."
    redirect_to @task.project
  end
end
