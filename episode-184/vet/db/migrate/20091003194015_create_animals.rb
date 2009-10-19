class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|
      t.string :name
      t.integer :category_id
      t.date :born_on
      t.boolean :female
      t.timestamps
    end
  end
  
  def self.down
    drop_table :animals
  end
end
