class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article: @article)
    @recent_articles = Article.order("published_at desc")
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      expire_fragment("recent_articles")
      redirect_to @article, notice: "Article has been updated."
    else
      render "edit"
    end
  end
end
