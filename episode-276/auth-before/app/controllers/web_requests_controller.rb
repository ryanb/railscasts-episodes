class WebRequestsController < ApplicationController
  def new
    @web_request = WebRequest.new
  end

  def create
    @web_request = WebRequest.create!(params[:web_request])
    redirect_to @web_request
  end

  def show
    @web_request = WebRequest.find(params[:id])
  end
end
