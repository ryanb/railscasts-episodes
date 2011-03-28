class CommentsController < ApplicationController
  expose(:article)
  expose(:comments) { article.comments }
  expose(:comment)
  
  def index
  end

  def new
  end

  def create
    if comment.save
      redirect_to comment.article, :notice => "Successfully created comment."
    else
      render :new
    end
  end
end
