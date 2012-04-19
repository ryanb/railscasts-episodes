class NewslettersController < ApplicationController
  def deliver
    newsletter = Newsletter.find(params[:id])
    sleep 10 # simulate long newsletter delivery
    newsletter.update_attribute(:delivered_at, Time.zone.now)
    redirect_to newsletters_url, notice: "Delivered newsletter."
  end

  def index
    @newsletters = Newsletter.order("id")
  end
end
