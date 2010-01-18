class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end
  
  def show
    @survey = Survey.find(params[:id])
  end
  
  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times { question.answers.build }
    end
  end
  
  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      flash[:notice] = "Successfully created survey."
      redirect_to @survey
    else
      render :action => 'new'
    end
  end
  
  def edit
    @survey = Survey.find(params[:id])
  end
  
  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully updated survey."
      redirect_to @survey
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to surveys_url
  end
end
