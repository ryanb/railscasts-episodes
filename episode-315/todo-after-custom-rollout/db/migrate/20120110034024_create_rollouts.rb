class CreateRollouts < ActiveRecord::Migration
  def change
    create_table :rollouts do |t|
      t.string :name
      t.string :group
      t.integer :user_id
      t.integer :percentage
      t.integer :failure_count

      t.timestamps
    end
  end
end
