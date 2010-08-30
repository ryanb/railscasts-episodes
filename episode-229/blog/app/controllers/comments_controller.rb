class CommentsController < ApplicationController
  def index
    @comments = Comment.where("article_id = ? and created_at > ?", params[:article_id], Time.at(params[:after].to_i + 1))
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @comment.article
    else
      render :action => 'new'
    end
  end
end
