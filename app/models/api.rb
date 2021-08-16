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
            binding.pry
            coin_info = Coin.find_or_create_by(coin)
        end
        p Coin.all
    end

    def self.create_coin(coin_info)
        base = coin_info[1]
        price_info = base["quote"]["USD"]
         = base["name"]
         = base["symbol"]
         = base["date_added"]
         = base["max_supply"]
         = base["circulating_supply"]
         = base["total_supply"]
         = price_info["price"]
         = price_info["volume_24h"]
         = price_info["percent_change_24h"]
         = price_info["percent_change_7d"]
         = price_info["market_cap"]
    end
end
Api.create_coins