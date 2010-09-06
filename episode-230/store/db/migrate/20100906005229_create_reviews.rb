class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :product_id
      t.text :content
      t.integer :rating
      t.timestamps
    end
  end
  
  def self.down
    drop_table :reviews
  end
end
