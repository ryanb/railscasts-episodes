class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :membership_number

      t.timestamps
    end
  end
end
