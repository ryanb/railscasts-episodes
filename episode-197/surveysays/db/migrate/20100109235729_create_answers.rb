class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :question_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
