class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = UserDecorator.find(params[:id])
  end
end
