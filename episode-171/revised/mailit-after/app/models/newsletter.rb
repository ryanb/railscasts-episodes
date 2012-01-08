class Newsletter < ActiveRecord::Base
  def self.deliver(id)
    find(id).deliver
  end
  
  def deliver
    sleep 10 # simulate long newsletter delivery
    update_attribute(:delivered_at, Time.zone.now)
  end
end
