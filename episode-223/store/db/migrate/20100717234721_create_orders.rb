class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.decimal :total_price
      t.datetime :purchased_at
      t.boolean :shipping
      t.timestamps
    end
  end
  
  def self.down
    drop_table :orders
  end
end
