class Article < ActiveRecord::Base
  has_many :comments, :as => :commentable
end
