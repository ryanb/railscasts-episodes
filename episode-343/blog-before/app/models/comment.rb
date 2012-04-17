class Comment < ActiveRecord::Base
  attr_accessible :article_id, :article, :content, :name
  belongs_to :article
end
