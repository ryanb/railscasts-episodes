class Comment < ActiveRecord::Base
  belongs_to :article, :touch => true
  validates_presence_of :author_name, :content
end
