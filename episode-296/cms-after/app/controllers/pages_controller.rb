class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end
  
  def mercury_update
    page = Page.find(params[:id])
    page.name = params[:content][:page_name][:value]
    page.content = params[:content][:page_content][:value]
    page.save!
    render text: ""
  end
end
