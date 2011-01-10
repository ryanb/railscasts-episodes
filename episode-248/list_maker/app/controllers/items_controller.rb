class ItemsController < ApplicationController
  respond_to :html, :json
  
  def index
    @items = Item.all
    respond_with(@items)
  end

  def create
    Item.create!(params[:item])
    redirect_to items_url
  end
end
