class Snippet < ActiveRecord::Base
  attr_accessible :name, :language, :plain_code, :highlighted_code
end
