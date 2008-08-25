class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.boolean :complete
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tasks
  end
end
