class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :shipping_name
      t.string :billing_name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :orders
  end
end
