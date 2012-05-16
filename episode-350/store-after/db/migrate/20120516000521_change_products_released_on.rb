class ChangeProductsReleasedOn < ActiveRecord::Migration
  def up
    rename_column :products, :released_on, :released_at
    change_column :products, :released_at, :datetime
  end

  def down
    change_column :products, :released_at, :date
    rename_column :products, :released_at, :released_on
  end
end
