class Product < ActiveRecord::Base
  def for_mustache
    Thread.current[:product_v8] ||= V8::Context.new.tap do |context|
      coffee = File.read(Rails.root.join("app/assets/javascripts/product.js.coffee"))
      javascript = CoffeeScript.compile(coffee)
      context.eval(javascript)
    end
    Thread.current[:product_v8].eval("new Product(#{to_json})")
  end
end
