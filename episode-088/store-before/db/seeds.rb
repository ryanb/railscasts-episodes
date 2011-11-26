require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.id = row[0]
    country.name = row[1]
  end
end

puts "Importing states..."
CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
  State.create! do |state|
    state.name = row[0]
    state.country_id = row[2]
  end
end
