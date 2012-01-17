require "greeter"

use Rack::Reloader, 0
# use Rack::Auth::Basic do |username, password|
#   password == "secret"
# end

run Rack::Cascade.new([Rack::File.new("public"), Greeter])
