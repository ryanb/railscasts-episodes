class AddDiscontinuedToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :discontinued, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :products, :discontinued
  end
end
