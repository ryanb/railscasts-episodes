class PlansController < ApplicationController
  def index
    @plans = Plan.order("price")
  end
end
