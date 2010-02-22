class Article < ActiveRecord::Base
  scope :visible, where("hidden != ?", true)
  scope :published, lambda { where("published_at <= ?", Time.zone.now) }
  scope :recent, visible.published.order("published_at desc")
end
