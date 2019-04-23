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

  def self.update_description(single, description)
    if single.description == nil
    single.description = description
    end
  end

  def self.find_by_name(shortcode)
    single = self.all.detect{|c| c.short_code == shortcode}
    single
  end

  def self.all
    @@all
  end

end
