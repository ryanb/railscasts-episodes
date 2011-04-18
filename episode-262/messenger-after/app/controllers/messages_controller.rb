class MessagesController < ApplicationController
  def index
    @messages = Message.scoped
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new(:parent_id => params[:parent_id])
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to messages_url
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url
  end
end
