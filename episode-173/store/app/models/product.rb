class Product < ActiveRecord::Base
  belongs_to :category
  
  def self.fetch_prices
    scraper = Scraper.define do
      process "div.firstRow div.priceAvail>div>div.PriceCompare>div.BodyS", :price => :text
      result :price
    end
    
    find_all_by_price(nil).each do |product|
      uri = URI.parse("http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=" + CGI.escape(product.name) + "&Find.x=0&Find.y=0&Find=Find")
      product.update_attribute :price, scraper.scrape(uri)[/[.0-9]+/]
    end
  end
end
