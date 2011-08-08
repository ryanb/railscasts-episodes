class Comment < ActiveRecord::Base
  attr_accessible :article_id, :content
  belongs_to :article
end
