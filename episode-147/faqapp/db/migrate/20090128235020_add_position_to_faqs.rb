class AddPositionToFaqs < ActiveRecord::Migration
  def self.up
    add_column :faqs, :position, :integer
  end

  def self.down
    remove_column :faqs, :position
  end
end
