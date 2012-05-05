class Authorship < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
end
