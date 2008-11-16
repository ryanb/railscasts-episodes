class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :product_id
      t.string :name
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :reviews
  end
end
