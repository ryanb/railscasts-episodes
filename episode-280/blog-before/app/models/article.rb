class Article < ActiveRecord::Base
  attr_accessible :name, :content, :published_at
  has_many :comments

  def word_count
    words = content.scan(/\\w+/)
    words.size
  end
end
