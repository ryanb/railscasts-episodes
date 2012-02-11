class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in successfully."
    else
      flash.now.alert = "Invalid name or password."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have been logged out."
  end
end
