class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :name

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
