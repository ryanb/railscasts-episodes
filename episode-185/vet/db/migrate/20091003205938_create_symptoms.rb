class CreateSymptoms < ActiveRecord::Migration
  def self.up
    create_table :symptoms do |t|
      t.integer :animal_id
      t.integer :problem_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :symptoms
  end
end
