class TasksController < ApplicationController
  before_filter :login_required
  
  def new
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.build
  end
  
  def create
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.build(params[:task])
    if @task.save
      flash[:notice] = "Successfully created task."
      redirect_to @task.project
    else
      render :action => 'new'
    end
  end
  
  def edit
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end
  
  def update
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Successfully updated task."
      redirect_to @task.project
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    flash[:notice] = "Successfully destroyed task."
    redirect_to @task.project
  end
end
