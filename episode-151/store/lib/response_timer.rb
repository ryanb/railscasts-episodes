class ResponseTimer
  def initialize(app, message = "Response Time")
    @app = app
    @message = message
  end
  
  def call(env)
    dup._call(env)
  end
  
  def _call(env)
    @start = Time.now
    @status, @headers, @response = @app.call(env)
    @stop = Time.now
    [@status, @headers, self]
  end
  
  def each(&block)
    block.call("<!-- #{@message}: #{@stop - @start} -->\n") if @headers["Content-Type"].include? "text/html"
    @response.each(&block)
  end
end