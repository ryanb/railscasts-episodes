class Order < ActiveRecord::Base
  scope :shipping, where(:shipping => true)
  scope :download, where(:shipping => false)
  
  def self.total_on(date)
    where("date(purchased_at) = ?", date).sum(:total_price)
  end
end
