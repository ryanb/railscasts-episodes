#Creates the two database tables, plus indexes, you'll need to use A/Bingo.

class AbingoMigration<%= version -%>< ActiveRecord::Migration
  def self.up
    create_table "experiments", :force => true do |t|
      t.string "test_name"
      t.string "status"
      t.timestamps
    end

    add_index "experiments", "test_name"
    #add_index "experiments", "created_on"

    create_table "alternatives", :force => true do |t|
      t.integer :experiment_id
      t.string :content
      t.string :lookup, :limit => 32
      t.integer :weight, :default => 1
      t.integer :participants, :default => 0
      t.integer :conversions, :default => 0
    end

    add_index "alternatives", "experiment_id"
    add_index "alternatives", "lookup"  #Critical for speed, since we'll primarily be updating by that.
  end

  def self.down
    drop_table :experiments
    drop_table :alternatives
  end
end
