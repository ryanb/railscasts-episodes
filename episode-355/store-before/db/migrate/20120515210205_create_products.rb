class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :category
      t.decimal :price, :precision => 2, :scale => 8
      t.datetime :released_at
      t.datetime :discontinued_at
      t.integer :stock
      t.timestamps
    end
    add_index :products, :category_id
  end
end
