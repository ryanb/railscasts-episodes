class AddScheduledAtToMailings < ActiveRecord::Migration
  def self.up
    add_column :mailings, :scheduled_at, :datetime
  end

  def self.down
    remove_column :mailings, :scheduled_at
  end
end
