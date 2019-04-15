require "pry"
require 'open-uri'

class Scraper
  def get_page
    page = Nokogiri::HTML(open("https://www.coinbase.com/price"))
  end
end
