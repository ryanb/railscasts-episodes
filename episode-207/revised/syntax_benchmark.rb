require "rubygems"
require "benchmark"
require "coderay"
require "pygments"
require "uv"

repeat = 50
content = File.read(__FILE__)

# run it once to initialize
CodeRay.scan(content, "ruby").div(css: :class)
Pygments.highlight(content, lexer: "ruby")
Uv.parse(content, "xhtml", "ruby", true, "amy")

Benchmark.bm(11) do |b|
  b.report("coderay") do
    repeat.times { CodeRay.scan(content, "ruby").div(css: :class) }
  end

  b.report("pygments") do
    repeat.times { Pygments.highlight(content, lexer: "ruby") }
  end
  
  b.report("ultraviolet") do
    repeat.times { Uv.parse(content, "xhtml", "ruby", true, "amy") }
  end
end
