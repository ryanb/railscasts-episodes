class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message])
    PrivatePub.publish_to("/messages/new", message: @message)
  end
end
