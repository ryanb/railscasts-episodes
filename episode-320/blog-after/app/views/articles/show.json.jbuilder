json.(@article, :id, :name, :published_at)
json.edit_url edit_article_url(@article) if current_user.admin?

json.author do |json|
  json.(@article.author, :id, :name)
  json.url author_url(@article.author)
end

json.comments @article.comments do |json, comment|
  json.partial! comment
end