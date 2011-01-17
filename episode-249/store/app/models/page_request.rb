class PageRequest < ActiveRecord::Base
  attr_accessible :path, :page_duration, :view_duration, :db_duration
end
