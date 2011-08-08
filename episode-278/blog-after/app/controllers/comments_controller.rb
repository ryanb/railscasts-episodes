class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.save!
    redirect_to @comment.article, :notice => "Successfully created comment."
  end
end
