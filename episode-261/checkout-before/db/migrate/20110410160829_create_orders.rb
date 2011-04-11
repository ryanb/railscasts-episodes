class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :credit_card_number
      t.date :credit_card_expires_on
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
