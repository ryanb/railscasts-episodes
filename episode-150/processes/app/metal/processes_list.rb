# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class ProcessesList
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/processes_list/
      [200, {"Content-Type" => "text/html"}, [`ps -axcr -o "pid,pcpu,pmem,time,comm"`]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
