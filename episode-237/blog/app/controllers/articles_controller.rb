class ArticlesController < ApplicationController
  def index
    @articles = Article.order("important desc")
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(:article_id => @article.id)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new
    @article.accessible = :all if admin?
    @article.attributes = params[:article]
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.accessible = :all if admin?
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to @article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
end
