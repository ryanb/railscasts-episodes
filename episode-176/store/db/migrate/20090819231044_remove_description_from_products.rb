class RemoveDescriptionFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :description
  end

  def self.down
    add_column :products, :description, :text
  end
end
