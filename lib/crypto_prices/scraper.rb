class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.coinbase.com/price"))
  end


  def make_restaurants
    scrape_restaurants_index.each do |r|
      WorldsBestRestaurants::Restaurant.new_from_index_page(r)
    end
  end
end
