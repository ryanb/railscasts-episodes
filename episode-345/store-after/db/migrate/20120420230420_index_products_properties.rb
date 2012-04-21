class IndexProductsProperties < ActiveRecord::Migration
  def up
    execute "CREATE INDEX products_properties ON products USING GIN(properties)"
  end

  def down
    execute "DROP INDEX products_properties"
  end
end
