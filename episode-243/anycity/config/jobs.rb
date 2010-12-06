require "sqlite3"
require "json"
require "net/http"

RAILS_ENV = ENV["RAILS_ENV"] || "development"

db = SQLite3::Database.new(File.expand_path("../../db/#{RAILS_ENV}.sqlite3", __FILE__))

job "city.fetch_name" do |args|
  zip = db.get_first_value("select zip_code from cities where id=?", args["id"])
  url = "http://ws.geonames.org/postalCodeLookupJSON?postalcode=#{zip}&country=US"
  json = Net::HTTP.get_response(URI.parse(url)).body
  name = JSON.parse(json)["postalcodes"].first["placeName"]
  db.execute("update cities set name=? where id=?", name, args["id"])
end

error do |exception|
  # ...
end