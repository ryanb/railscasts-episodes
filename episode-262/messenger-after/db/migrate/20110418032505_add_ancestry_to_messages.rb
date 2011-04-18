class AddAncestryToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :ancestry, :string
    add_index :messages, :ancestry
  end

  def self.down
    remove_index :messages, :ancestry
    remove_column :messages, :ancestry
  end
end
