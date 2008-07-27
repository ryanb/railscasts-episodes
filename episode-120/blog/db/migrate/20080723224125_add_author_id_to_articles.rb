class AddAuthorIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :author_id, :integer
    remove_column :articles, :author_name
  end

  def self.down
    add_column :articles, :author_name, :string
    remove_column :articles, :author_id
  end
end
