class Mailing < ActiveRecord::Base
  def self.next_for_delivery
    Mailing.first(:conditions => ["delivered_at IS NULL AND scheduled_at <= ?", Time.now.utc], :order => "scheduled_at")
  end
  
  def deliver
    update_attribute(:scheduled_at, nil)
    sleep 10 # placeholder for sending email
    update_attribute(:delivered_at, Time.now)
  end
end
