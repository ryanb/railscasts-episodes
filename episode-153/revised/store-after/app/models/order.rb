class Order < ActiveRecord::Base
  has_many :line_items

  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
end
