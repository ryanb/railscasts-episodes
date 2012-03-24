server "72.14.183.209", :web, :app, :db, primary: true
set :user, "deployer"

set :recipient, "Ruby"

default_run_options[:pty] = true

task :hello, roles: :db do
  puts "Hello #{fetch(:recipient, "World")}"
  # run "echo 'Hello World' > ~/hello"
  run "#{sudo} cp ~/hello /hello"
  # goodbye
end

task :goodbye do
  puts "Goodbye #{recipient}"
end
after :hello, :goodbye
