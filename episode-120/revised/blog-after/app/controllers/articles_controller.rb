class ArticlesController < ApplicationController
  def index
    @articles = Article.search(params[:search])
    # Search options:
    #   order: :name
    #   page: 1, per_page: 20
    #   conditions: {name: "Batman"}
    #   with: {author_id: 2}
    #   with: {created_at: 3.weeks.ago..Time.zone.now}
    #   field_weights: {name: 20, content: 10, author_name: 5}
    #   match_mode: :boolean
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article_id: @article.id)
  end
end
