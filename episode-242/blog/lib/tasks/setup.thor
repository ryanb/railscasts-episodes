class Setup < Thor
  desc "config [NAME]", "copy configuration files"
  method_options :force => :boolean
  def config(name = "*")
    Dir["config/examples/#{name}"].each do |source|
      destination = "config/#{File.basename(source)}"
      FileUtils.rm(destination) if options[:force] && File.exist?(destination)
      if File.exist?(destination)
        puts "Skipping #{destination} because it already exists"
      else
        puts "Generating #{destination}"
        FileUtils.cp(source, destination)
      end
    end
  end
  
  desc "populate", "generate records"
  method_options :count => 10
  def populate
    require File.expand_path('config/environment.rb')
    options[:count].times do |num|
      puts "Generating article #{num}"
      Article.create!(:name => "Article #{num}")
    end
  end
end