class Article < ActiveRecord::Base
  attr_accessible :author, :content, :name, :published_at
end
