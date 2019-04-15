class Coin

  attr_accessor :name, :short_code, :price, :url, :market_cap, :description

  @@all = []

  def initialize(coin_hash)
    coin_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_full_list(coins_array)
    coins_array.each do |coin_hash|
      Coin.new(coin_hash)
    end
  end

  def self.all
    @@all
  end

end
