class AddSearchIndexToArticles < ActiveRecord::Migration
  def up
    execute "create index articles_name on articles using gin(to_tsvector('english', name))"
    execute "create index articles_content on articles using gin(to_tsvector('english', content))"
  end

  def down
    execute "drop index articles_name"
    execute "drop index articles_content"
  end
end
