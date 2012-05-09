class TasksController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @tasks }
    # end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    render json: @task
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    render json: @task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    head :no_content
  end
end
