class AddRpxToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :rpx_identifier, :string
  end

  def self.down
    remove_column :users, :rpx_identifier
  end
end
