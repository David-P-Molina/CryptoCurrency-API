require 'pry'
require 'httparty'

class Api < ApplicationRecord
    include HTTParty
    def assemble_url
        api_url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
        key = ENV[API_KEY]
        limiter = "&id=1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,22&convert=USD"
        api_call = "#{url + key + limiter}"
        api_call
    end
    def self.retrieve_coins_info(url)
        coins_response = HTTParty.get(url)
        coins_list = coins_response.body
        coins_list
    end

    def self.parse_coin(coins_list)
        JSON.parse(coins_list)
    end

    def self.create_coins

    end
end
