class Mailing < ActiveRecord::Base
  def deliver
    sleep 10 # placeholder for sending email
    update_attribute(:delivered_at, Time.now)
  end
end
