class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  
  define_index do
    indexes content
    indexes :name, sortable: true
    indexes comments.content, as: :comment_content
    indexes [author.first_name, author.last_name], as: :author_name
    
    has author_id, published_at
  end
end
