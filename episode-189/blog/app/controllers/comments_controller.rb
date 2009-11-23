class CommentsController < ApplicationController
  filter_resource_access
  
  def new
  end
  
  def create
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to article_url(@comment.article_id)
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to article_url(@comment.article_id)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to article_url(@comment.article_id)
  end
end
