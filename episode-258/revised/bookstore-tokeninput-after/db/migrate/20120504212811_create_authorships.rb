class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.belongs_to :book
      t.belongs_to :author

      t.timestamps
    end
    add_index :authorships, :book_id
    add_index :authorships, :author_id
  end
end
