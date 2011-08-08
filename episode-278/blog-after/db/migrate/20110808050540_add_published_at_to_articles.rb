class AddPublishedAtToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :published_at, :datetime
  end

  def self.down
    remove_column :articles, :published_at
  end
end
