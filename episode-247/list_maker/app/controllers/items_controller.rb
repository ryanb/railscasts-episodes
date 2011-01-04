class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create!(params[:item])
    redirect_to items_url
  end
end
