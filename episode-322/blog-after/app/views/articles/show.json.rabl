object @article
attributes :id, :name, :published_at

if current_user.admin?
  node(:edit_url) { |article| edit_article_url(article) }
end

child :author do
  attributes :id, :name
  node(:url) { |author| author_url(author) }
end

child :comments do
  attributes :id, :name, :content
end
