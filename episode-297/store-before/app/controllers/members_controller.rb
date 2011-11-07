class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to root_url, notice: "Saved member successfully"
    else
      render :new
    end
  end
end
