module OrdersHelper
  def orders_chart_series(orders, start_time)
    orders_by_day = orders.where(:purchased_at => start_time.beginning_of_day..Time.zone.now.end_of_day).
                    group("date(purchased_at)").
                    select("purchased_at, sum(total_price) as total_price")
    (start_time.to_date..Date.today).map do |date|
      order = orders_by_day.detect { |order| order.purchased_at.to_date == date }
      order && order.total_price.to_f || 0
    end.inspect
  end
end
