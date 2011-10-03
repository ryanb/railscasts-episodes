class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :twitter_name
      t.string :github_name
      t.string :url
      t.string :avatar_image_name
      t.text :bio

      t.timestamps
    end
  end
end
