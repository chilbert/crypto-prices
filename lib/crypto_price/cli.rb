require "pry"

class CLI

  def call
    puts "Welcome to the Coin Base CLI.  You are viewing the tradeable coins at Coinbase.com!"
    start
  end

  def start
    puts ""
    make_coins
    display_coins
    more_detail
    closing_time
  end

  def make_coins
    if Coin.all.empty?
      coins_array = Scraper.scrape_index_page
      Coin.create_from_full_list(coins_array)
      Coin.all
    else
      Coin.all
  end

  end

  def display_coins
    Coin.all.each do |coin|
      puts "#{coin.name}" + " - (#{coin.short_code.upcase})"
      puts "  Price:" + " #{coin.price}"
      puts "----------------------"
    end
  end

  def coin_detail(input)
    single = Coin.find_by_name(input)
    description = Scraper.scrape_description(single.url)
    Coin.update_description(single, description)
    puts "#{single.name}" + " - (#{single.short_code.upcase})"
    puts ""
    puts " Price:" + " #{single.price}"
    puts " Market Cap" + " #{single.market_cap}"
    puts " Description:" + " #{single.description}"
    puts " Coin Website:" + " #{single.url}"
    sleep(3)
  end

  def more_detail
    puts ""
    puts "View detail on a coin by typing the coin shortcode (i.e. 'BTC' or 'ETH'). To view full list again type, LIST. To exit, type N."

    input = gets.strip.upcase

    puts ""
    puts ""

    if Coin.find_by_name(input)
      coin_detail(input)
    elsif input == "N"
      puts ""
      puts "Thank you! Have a great day and happy investing!"
      exit
    elsif input == "LIST"
      start
    else
      puts ""
      puts "I don't understand that answer.  Remember to use the coin shortcode."
      sleep(3)
      start
    end
  end


def closing_time
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
        puts ""
        start
      end
  end


end
