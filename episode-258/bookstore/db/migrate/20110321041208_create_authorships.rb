class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :book_id
      t.integer :author_id
      t.timestamps
    end
  end

  def self.down
    drop_table :authorships
  end
end
