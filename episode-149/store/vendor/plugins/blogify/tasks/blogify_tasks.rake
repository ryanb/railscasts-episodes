namespace :blogify do
  desc "Sync extra files from blogify plugin."
  task :sync do
    system "rsync -ruv vendor/plugins/blogify/db/migrate db"
    system "rsync -ruv vendor/plugins/blogify/public ."
  end
end