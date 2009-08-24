class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.string :keywords
      t.integer :category_id
      t.float :minimum_price
      t.float :maximum_price
      t.timestamps
    end
  end
  
  def self.down
    drop_table :searches
  end
end
