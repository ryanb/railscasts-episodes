class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.user = User.first # you would normally add it to the current user
    if @project.save
      redirect_to @project.user, notice: "Project has been created"
    else
      render "new"
    end
  end
end
