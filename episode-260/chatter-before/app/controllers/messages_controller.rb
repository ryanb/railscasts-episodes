class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to messages_url
    else
      render :action => 'new'
    end
  end
end
