class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    @page.revert_to(params[:version].to_i) if params[:version]
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end
  
  def named
    @page = Page.find_or_initialize_by_name(params[:name])
    if @page.new_record?
      render :action => 'new'
    else
      redirect_to @page
    end
  end
end
