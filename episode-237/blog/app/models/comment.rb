class Comment < ActiveRecord::Base
  attr_accessible :article_id, :name, :content
  belongs_to :article
end
