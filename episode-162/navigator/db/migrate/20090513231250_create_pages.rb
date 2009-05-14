class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :parent_id
      t.string :name
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :pages
  end
end
