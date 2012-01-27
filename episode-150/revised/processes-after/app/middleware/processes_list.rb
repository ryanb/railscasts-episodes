class ProcessesList
  def initialize(app)
    @app = app
  end
  
  def call(env)
    if env["PATH_INFO"] == "/processes/list"
      list = `ps -axcr -o 'pid,pcpu,pmem,time,comm'`
      [200, {"Content-Type" => "text/plain"}, [list]]
    else
      @app.call(env)
    end
  end
end
