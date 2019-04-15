require "pry"

class CLI

  def call
    Scraper.new.scrape_index_page
    puts "Welcome to the Coin Base CLI.  You are about to see the tradeable coins at Coinbase.com!"
    start
  end

  def start
    puts ""

    print_coins(input)

    puts ""
    puts "What Coin would you like more information on?"
    input = gets.strip

    restaurant = WorldsBestRestaurants::Restaurant.find(input.to_i)

    print_restaurant(restaurant)

    puts ""
    puts "Would you like to see information on another coin? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day and happy investing!"
      exit
    else
      puts ""
      puts "I don't understand that answer and I sure cannot invest it"
      start
    end
  end


end
