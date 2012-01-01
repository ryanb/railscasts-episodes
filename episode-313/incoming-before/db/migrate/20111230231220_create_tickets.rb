class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :from
      t.text :body

      t.timestamps
    end
  end
end
