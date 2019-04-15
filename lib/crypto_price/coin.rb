class Coin

  attr_accessor :name, :short_code, :price, :url, :market_cap, :description, :website_url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
