class AddLayoutToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :layout_name, :string
    add_column :blogs, :custom_layout_content, :text
  end

  def self.down
    remove_column :blogs, :custom_layout_content
    remove_column :blogs, :layout_name
  end
end
