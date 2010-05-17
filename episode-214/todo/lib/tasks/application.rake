desc "Setup all for app"
task :setup => ['db:migrate', 'load:projects', 'load:tasks']

namespace :load do
  desc "Load projects into database"
  task :projects do
    Project.delete_all
    ['Yardwork', 'Housework', 'Programming'].each do |name|
      Project.create!(:name => name)
    end
  end
  
  desc "Load tasks into database"
  task :tasks do
    Task.delete_all
    projects = Project.all
    words = File.readlines("/usr/share/dict/words").sort_by { rand }
    35.times do
      Task.create!(:name => words.pop.titleize, :project => projects.rand)
    end
  end
end
