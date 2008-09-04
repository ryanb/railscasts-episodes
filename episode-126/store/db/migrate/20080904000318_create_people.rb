class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :country
      t.string :state
      t.string :city
      t.string :zip
      t.string :street
      t.string :email
      t.timestamps
    end
  end
  
  def self.down
    drop_table :people
  end
end
