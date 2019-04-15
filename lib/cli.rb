require "pry"

class CLI

  def call
    Scraper.new.get_page
    puts "Welcome to the Coin Base CLI.  You are about to see the tradeable coins at Coinbase.com!"
  end


end
