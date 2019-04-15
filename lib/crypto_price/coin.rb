class Coin

  attr_accessor :name, :short_code, :price, :url, :change, :website_url, :market_cap, :description

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
