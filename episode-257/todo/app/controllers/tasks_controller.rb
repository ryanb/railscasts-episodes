class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.create!(params[:task])
    redirect_to tasks_url, :notice => "Successfully added task."
  end
end
