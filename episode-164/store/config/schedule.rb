every 2.hours do
  rake "thinking_sphinx:index"
end

every :reboot do
  rake "thinking_sphinx:start"
end

every :saturday, :at => "4:38am" do
  command "rm -rf #{RAILS_ROOT}/tmp/cache"
  runner "Cart.remove_abandoned"
end
