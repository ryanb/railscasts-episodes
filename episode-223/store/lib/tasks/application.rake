desc "Generate random orders"
task :generate_orders => :environment do
  Order.delete_all
  generator = proc do |start_time, end_time, shipping|
    time = Time.at(rand(end_time.to_i - start_time.to_i) + start_time.to_i)
    dollars = rand(200) + 10
    Order.create!(:total_price => dollars, :purchased_at => time, :shipping => rand(shipping))
  end
  200.times { generator.call(10.days.ago, Time.zone.now.end_of_day, 1) }
  500.times { generator.call(1.month.ago, Time.zone.now.end_of_day, 2) }
  Order.create!(:total_price => 10, :purchased_at => 1.month.ago.beginning_of_day, :shipping => true)
end
