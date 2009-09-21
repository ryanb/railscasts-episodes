begin
  require 'deadweight'
rescue LoadError
end

desc "run Deadweight CSS check (requires script/server)"
task :deadweight do
  dw = Deadweight.new
  dw.stylesheets = ["/stylesheets/application.css"]
  dw.pages = ["/", "/feeds", "/about", "/episodes/archive", "/comments", "/episodes/1-caching-with-instance-variables"]
  dw.ignore_selectors = /flash_notice|flash_error|errorExplanation|fieldWithErrors/
  puts dw.run
end
