class CommentsController < ApplicationController
  before_filter :authorize, :only => [:edit, :update]
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      user_session.add_comment(@comment)
      flash[:notice] = "Successfully created comment."
      redirect_to article_url(@comment.article_id)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to article_url(@comment.article_id)
    else
      render :action => 'edit'
    end
  end
  
  private
  
  def authorize
    unless user_session.can_edit_comment?(Comment.find(params[:id]))
      flash[:error] = "You are no longer able to edit this comment."
      redirect_to root_url
    end
  end
end
