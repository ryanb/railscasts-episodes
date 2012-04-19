class Newsletter < ActiveRecord::Base
  attr_accessible :delivered_at, :subject
end
