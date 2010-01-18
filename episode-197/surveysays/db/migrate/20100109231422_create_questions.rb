class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :survey_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
