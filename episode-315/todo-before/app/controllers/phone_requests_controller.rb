class PhoneRequestsController < ApplicationController
  before_filter :authenticate

  def new
  end

  def create
    # Send to do list to phone number here
    redirect_to tasks_url, notice: "Sent list to #{params[:phone_number]}"
  end
end
