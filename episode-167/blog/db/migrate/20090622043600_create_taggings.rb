class CreateTaggings < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :taggings
  end
end
