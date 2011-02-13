class CreatePaintings < ActiveRecord::Migration
  def self.up
    create_table :paintings do |t|
      t.integer :gallery_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :paintings
  end
end
