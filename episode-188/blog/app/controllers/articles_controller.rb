class ArticlesController < ApplicationController
  filter_resource_access
  
  def index
    @articles = Article.find(:all)
  end
  
  def show
    @comment = Comment.new(:article => @article)
  end
  
  def new
  end
  
  def create
    @article.user = current_user
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to @article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
end
