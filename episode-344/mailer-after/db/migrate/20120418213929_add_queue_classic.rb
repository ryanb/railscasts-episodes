class AddQueueClassic < ActiveRecord::Migration
  def up
    create_table :queue_classic_jobs do |t|
      t.string :q_name
      t.string :method
      t.text :args
      t.timestamp :locked_at
    end
    add_index :queue_classic_jobs, :id
  end

  def down
    drop_table :queue_classic_jobs
  end
end
