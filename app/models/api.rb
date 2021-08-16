require 'pry'
require 'httparty'
require "dotenv"
Dotenv.load

class Api 
    include HTTParty
    def self.assemble_url
        api_url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
        key = ENV["API_KEY"]
        limiter = "&id=1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,22&convert=USD"
        api_call = "#{api_url + key + limiter}"
        api_call
    end
    def self.retrieve_coins_info
        coins_response = HTTParty.get(self.assemble_url)
        coins_list = coins_response.body
        coins_list
    end

    def self.parse_coin
       JSON.parse(self.retrieve_coins_info)
    end

    def self.create_coins
        test = self.parse_coin["data"]
        test.each do |coin|
            new_coin = Coin.new(coin)
            Api.create_coin(new_coin, coin)
        end
        p Coin.all
    end

    def self.create_coin(new_coin, coin)
        base = coin[1]
        price_info = base["quote"]["USD"]
        new_coin.name = base["name"]
        new_coin.symbol = base["symbol"]
        new_coin.initial_value = price_info["price"]
        new_coin.current_value = price_info["price"]
        new_coin.day = price_info["percent_change_24h"]
        new_coin.week = price_info["percent_change_7d"]
        new_coin.marketcap = price_info["market_cap"]
        new_coin.circulation = base["circulating_supply"]
        ## figure out what coloumns need to be added and what needs to be removed
        #new_coin. = base["total_supply"]
        #new_coin. = price_info["volume_24h"]
        # new_coin.date_added = base["date_added"]
        # new_coin. = base["max_supply"]
    end

    def update_coins
    
    end
    def update_coin(update_coin, info)
        base = info[1]
        price_info = base["quote"]["USD"]
        update_coin.current_value = price_info["price"]
        update_coin.day = price_info["percent_change_24h"]
        update_coin.week = price_info["percent_change_7d"]
        update_coin.marketcap = price_info["market_cap"]
        update_coin.circulation = base["circulating_supply"]
    end
end
Api.create_coins