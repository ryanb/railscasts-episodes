class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create!(params[:article])
    flash[:notice] = "New article created."
    redirect_to articles_path
  end
end
