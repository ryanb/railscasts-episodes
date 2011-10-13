class AddPositionToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :position, :integer
  end
end
