class PhoneRequestsController < ApplicationController
  before_filter :authenticate
  before_filter :rollout
  around_filter :degrade

  def new
  end

  def create
    # Send to do list to phone number here
    redirect_to tasks_url, notice: "Sent list to #{params[:phone_number]}"
  end

private

  def rollout
    unless rollout? :phone
      redirect_to root_url, alert: "Access denied"
    end
  end
  
  def degrade
    $degrade_phone.perform { yield }
  end
end
