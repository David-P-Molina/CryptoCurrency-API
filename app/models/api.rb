class Api < ApplicationRecord
    def self.retrieve_coins_info
        coins_response = (HTTParty.get("#{url + key + limiter}")
        coins_list = coins_response.body
        coins_list
    end

    def self.parse_coin(coins_list)
        JSON.parse(coins_list)
    end

    def self.create_coins

    end
url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
key = ENV[API_KEY]
limiter = "&id=1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,22&convert=USD"
coins = coins_response["data"]

end

# class Api
#     include HTTParty
#     base_uri = 'https://pro-api.coinmarketcap.com'
#     headers = {
#         CMC_PRO_API_KEY="+"fcde9892-d0e8-4f58-850c-6d58709fff97"
#     }
# end