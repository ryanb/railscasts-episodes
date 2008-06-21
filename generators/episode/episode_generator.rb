class EpisodeGenerator < RubiGen::Base
  attr_accessor :episode_number, :episode_name
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if @args.length != 2
    
    @episode_number = @args[0]
    @episode_name = @args[1]
  end
  
  def manifest
    record do |m|
      m.directory "episode-#{episode_number}"
      m.template "README.erb", "#{folder}/README"
    end
  end
  
  def folder
    "episode-#{episode_number}"
  end
  
  protected
    def banner
      <<-EOS
Creates an episode folder structure given number and name.
 
USAGE: #{$0} #{spec.name} [number] [name]
EOS
    end
end
