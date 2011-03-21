desc "Generate authors"
task :generate_authors => :environment do
  Author.delete_all
  200.times do 
    Author.create!(:name => Faker::Name.name)
  end
  ["Erich Gamma", "Richard Helm", "Ralph Johnson", "John M. Vlissides"].each do |name|
    Author.create!(:name => name)
  end
end