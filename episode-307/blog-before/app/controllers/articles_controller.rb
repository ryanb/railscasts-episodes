class ArticlesController < ApplicationController
  def index
    @articles = Article.search(params)
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article_id: @article.id)
  end
end
