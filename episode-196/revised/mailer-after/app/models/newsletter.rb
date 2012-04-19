class Newsletter < ActiveRecord::Base
  attr_accessible :delivered_at, :subject
  
  def self.deliver(id)
    newsletter = find(id)
    # raise "Oops"
    sleep 10 # simulate long newsletter delivery
    newsletter.update_attribute(:delivered_at, Time.zone.now)
  end
end
