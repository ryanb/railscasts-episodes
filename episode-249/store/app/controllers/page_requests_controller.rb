class PageRequestsController < ApplicationController
  def index
    @page_requests = PageRequest.all
  end
end
