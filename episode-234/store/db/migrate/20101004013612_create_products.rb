class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.date :released_on
      t.integer :category_id
      t.integer :rating
      t.boolean :discontinued
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
