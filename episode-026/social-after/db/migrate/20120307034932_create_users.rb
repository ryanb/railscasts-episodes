class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin, default: false, null: false
      t.timestamps
    end
  end
end
