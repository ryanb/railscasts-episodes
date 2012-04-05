class CreateArticleTranslations < ActiveRecord::Migration
  def up
    Article.create_translation_table!({
      name: :string,
      content: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Article.drop_translation_table! migrate_data: true
  end
end
