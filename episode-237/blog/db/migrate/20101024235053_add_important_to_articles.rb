class AddImportantToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :important, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :articles, :important
  end
end
