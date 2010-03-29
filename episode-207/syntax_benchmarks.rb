require "rubygems"
require "benchmark"
require "coderay"
require "uv"

path = __FILE__
content = File.read(__FILE__)

# run it once to initialize
CodeRay.scan("print 'hello'", "ruby").div(:css => :class)
Uv.parse("print 'test'", "xhtml", "ruby", true, "amy")

Benchmark.bm(11) do |b|
  b.report("coderay") do
    50.times { CodeRay.scan(content, "ruby").div(:css => :class) }
  end
  
  b.report("ultraviolet") do
    50.times { Uv.parse(content, "xhtml", "ruby", true, "amy") }
  end

  b.report("pygments") do
    50.times { `pygmentize -f html "#{path}"` }
  end
end
