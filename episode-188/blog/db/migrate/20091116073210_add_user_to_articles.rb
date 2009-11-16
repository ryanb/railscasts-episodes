class AddUserToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :user_id, :integer
    add_column :comments, :user_id, :integer
  end

  def self.down
    remove_column :comments, :user_id
    remove_column :articles, :user_id
  end
end
