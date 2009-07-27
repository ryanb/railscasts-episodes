desc "Setup all for app"
task :setup => ['db:migrate', 'db:fixtures:load']
