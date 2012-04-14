class Article < ActiveRecord::Base
  attr_accessible :author, :content, :name
end
