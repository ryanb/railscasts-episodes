class AddCustomUrlToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :custom_url, :string
  end

  def self.down
    remove_column :products, :custom_url
  end
end
