class Logger::SimpleFormatter
  def call(severity, time, progname, msg)
    "[#{severity}] #{msg}\n"
  end
end
