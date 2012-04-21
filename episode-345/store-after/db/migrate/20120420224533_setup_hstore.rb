class SetupHstore < ActiveRecord::Migration
  def self.up
    execute "CREATE EXTENSION hstore"
  end

  def self.down
    execute "DROP EXTENSION hstore"
  end
end
