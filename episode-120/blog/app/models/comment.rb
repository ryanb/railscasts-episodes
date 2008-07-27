class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of :author_name, :content
end
