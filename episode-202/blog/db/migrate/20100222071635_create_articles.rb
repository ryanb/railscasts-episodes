class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :name
      t.datetime :published_at
      t.boolean :hidden

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
