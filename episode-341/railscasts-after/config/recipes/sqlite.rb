namespace :sqlite do
  desc "Install the SQLite"
  task :install, roles: :app do
    run "#{sudo} apt-get -y install sqlite3 libsqlite3-dev"
  end
  after "deploy:install", "sqlite:install"

  desc "Generate the database.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/db/shared"
    run "mkdir -p #{shared_path}/config"
    template "sqlite.yml.erb", "#{shared_path}/config/database.yml"
  end
  after "deploy:setup", "sqlite:setup"

  desc "Symlink the database.yml and database into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/db/shared #{release_path}/db/shared"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "sqlite:symlink"
end
