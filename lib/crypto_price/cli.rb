require "pry"

class CLI

  def call
    puts "Welcome to the Coin Base CLI.  You are about to see the tradeable coins at Coinbase.com!"
    start
  end

  def start
    puts ""
    make_coins
    display_coins
    prompt
  end

  def make_coins
    coins_array = Scraper.scrape_index_page
    Coin.create_from_full_list(coins_array)
    Coin.all

  end

  def display_coins
    Coin.all.take(11).each do |coin|
      puts "#{coin.name}" + " - (#{coin.short_code.upcase})"
      puts "  Price:" + " #{coin.price}"
      puts "----------------------"
    end
  end

  def prompt
    puts ""
    puts "Which coin would you like to learn more about?"

    input = gets.strip

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
          puts "I don't understand that answer and sure cannot invest it."
          start
        end
  end


end
