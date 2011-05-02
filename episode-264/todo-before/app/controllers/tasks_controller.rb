class TasksController < ApplicationController
  def index
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_url, :notice => "Successfully added task."
    else
      render :index
    end
  end
end
