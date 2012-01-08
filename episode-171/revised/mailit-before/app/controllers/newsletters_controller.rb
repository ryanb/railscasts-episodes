class NewslettersController < ApplicationController
  def deliver
    @newsletter = Newsletter.find(params[:id])
    sleep 10 # simulate long newsletter delivery
    @newsletter.update_attribute(:delivered_at, Time.zone.now)
    redirect_to newsletters_url, notice: "Delivered newsletter."
  end

  def index
    @newsletters = Newsletter.all
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
      redirect_to @newsletter, notice: "Successfully created newsletter."
    else
      render :new
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update_attributes(params[:newsletter])
      redirect_to @newsletter, notice: "Successfully updated newsletter."
    else
      render :edit
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to newsletters_url, notice: "Successfully destroyed newsletter."
  end
end
