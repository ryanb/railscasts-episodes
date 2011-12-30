set :output, "#{path}/log/cron.log"
job_type :script, "'#{path}/script/:task' :output"

every 15.minutes do
  command "rm '#{path}/tmp/cache/foo.txt'"
  script "generate_report"
end

every :sunday, at: "4:28 AM" do
  runner "Cart.clear_abandoned"
end

every :reboot do
  rake "ts:start"
end
