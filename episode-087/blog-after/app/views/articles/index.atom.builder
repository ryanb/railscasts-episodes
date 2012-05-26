atom_feed do |feed|
  feed.title "Superhero Articles"
  feed.updated @articles.maximum(:updated_at)
  
  @articles.each do |article|
    feed.entry article, published: article.published_at do |entry|
      entry.title article.name
      entry.content article.content
      entry.author do |author|
        author.name article.author
      end
    end
  end
end