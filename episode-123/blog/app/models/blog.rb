class Blog < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
end
