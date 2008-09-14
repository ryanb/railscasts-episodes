class CreateMailings < ActiveRecord::Migration
  def self.up
    create_table :mailings do |t|
      t.string :subject
      t.text :content
      t.datetime :delivered_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :mailings
  end
end
