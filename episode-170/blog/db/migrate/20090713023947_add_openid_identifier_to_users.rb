class AddOpenidIdentifierToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :openid_identifier, :string
  end

  def self.down
    remove_column :users, :openid_identifier
  end
end
