class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.text :bio
      t.boolean :public_profile

      t.timestamps
    end
  end
end
