class CreatePageRequests < ActiveRecord::Migration
  def self.up
    create_table :page_requests do |t|
      t.string :path
      t.float :page_duration
      t.float :view_duration
      t.float :db_duration
      t.timestamps
    end
  end

  def self.down
    drop_table :page_requests
  end
end
