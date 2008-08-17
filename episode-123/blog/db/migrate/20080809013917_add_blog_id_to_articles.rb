class AddBlogIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :blog_id, :integer
  end

  def self.down
    remove_column :articles, :blog_id
  end
end
