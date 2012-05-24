class TasksController < ApplicationController
  def index
    @tasks = access_token.get("/api/tasks").parsed if access_token
  end

  def create
    access_token.post("/api/tasks", params: {task: {name: params[:name]}})
    redirect_to root_url
  end
end
