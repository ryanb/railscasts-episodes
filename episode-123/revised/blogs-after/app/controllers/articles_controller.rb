class ArticlesController < ApplicationController
  before_filter :load_blog
  
  def show
    @article = @blog.articles.find(params[:id])
  end
end
