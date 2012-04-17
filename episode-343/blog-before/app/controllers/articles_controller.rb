class ArticlesController < ApplicationController
  def index
    @articles = Article.text_search(params[:query]).page(params[:page]).per_page(3)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article_id: @article.id)
  end
end
