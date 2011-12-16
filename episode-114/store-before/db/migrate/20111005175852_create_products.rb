class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.datetime :released_at

      t.timestamps
    end
  end
end
