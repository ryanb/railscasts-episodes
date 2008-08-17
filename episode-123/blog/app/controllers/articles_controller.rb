class ArticlesController < ApplicationController
  before_filter :load_blog
  
  def index
    @articles = @current_blog.articles.find(:all)
  end
  
  def show
    @article = @current_blog.articles.find(params[:id])
    @comment = Comment.new(:article => @article)
  end
  
  def new
    @article = @current_blog.articles.build
  end
  
  def create
    @article = @current_blog.articles.build(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = @current_blog.articles.find(params[:id])
  end
  
  def update
    @article = @current_blog.articles.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to @article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = @current_blog.articles.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
end
