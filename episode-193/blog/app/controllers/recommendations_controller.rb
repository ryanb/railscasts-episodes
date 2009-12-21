class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new(:article_id => params[:article_id])
  end
  
  def create
    @recommendation = Recommendation.new(params[:recommendation])
    if @recommendation.valid?
      # send email
      flash[:notice] = "Successfully created recommendation."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
