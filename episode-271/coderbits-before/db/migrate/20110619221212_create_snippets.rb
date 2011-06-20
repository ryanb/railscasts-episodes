class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :name
      t.string :language
      t.text :plain_code
      t.text :highlighted_code
      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
