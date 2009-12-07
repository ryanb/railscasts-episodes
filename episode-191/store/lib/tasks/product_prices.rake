desc "Fetch product prices"
task :fetch_prices => :environment do
  require 'nokogiri'
  require 'open-uri'
  
  Product.find_all_by_price(nil).each do |product|
    url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=#{CGI.escape(product.name)}&Find.x=0&Find.y=0&Find=Find"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/[0-9\.]+/]
    product.update_attribute(:price, price)
  end
end

desc "Import wish list"
task :import_list => :environment do
  require 'mechanize'
  agent = WWW::Mechanize.new
  
  agent.get("http://railscasts.tadalist.com/session/new")
  form = agent.page.forms.first
  form.password = "secret"
  form.submit
  
  agent.page.link_with(:text => "Wish List").click
  agent.page.search(".edit_item").each do |item|
    Product.create!(:name => item.text.strip)
  end
end