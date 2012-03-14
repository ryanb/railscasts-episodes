# This migration comes from seo_meta_engine (originally 20110329222114)
class CreateSeoMeta < ActiveRecord::Migration

  def self.up
    create_table :seo_meta do |t|
      t.integer :seo_meta_id
      t.string :seo_meta_type

      t.string :browser_title
      t.string :meta_keywords
      t.text :meta_description

      t.timestamps
    end

    add_index :seo_meta, :id
    add_index :seo_meta, [:seo_meta_id, :seo_meta_type]
  end

  def self.down
    drop_table :seo_meta
  end

end
