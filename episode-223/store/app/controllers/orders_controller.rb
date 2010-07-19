class OrdersController < ApplicationController
  def index
    @orders = Order.order("purchased_at desc").paginate(:per_page => 20, :page => params[:page])
  end
end
