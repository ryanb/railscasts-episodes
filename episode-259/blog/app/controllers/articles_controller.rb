class ArticlesController < ApplicationController
  expose(:visible_articles) { Article.order(:name).where(:visible => true) }
  expose(:article)
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if article.save
      redirect_to article, :notice => "Successfully created article."
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if article.update_attributes(params[:article])
      redirect_to article, :notice => "Successfully updated article."
    else
      render :edit
    end
  end
  
  def destroy
    article.destroy
    redirect_to articles_url, :notice => "Successfully destroyed article."
  end
end
