class Article < ActiveRecord::Base
  translates :name, :content
end
