class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :articles, :through => :taggings
end
