url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
key = "?CMC_PRO_API_KEY=fcde9892-d0e8-4f58-850c-6d58709fff97"
limiter = "&id=1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,22&convert=USD"
coins_response = JSON.parse(HTTParty.get("#{url + key + limiter}").body)
coins = coins_response"data"]["1"]


# class Api
#     include HTTParty
#     base_uri = 'https://pro-api.coinmarketcap.com'
#     headers = {
#         CMC_PRO_API_KEY="+"fcde9892-d0e8-4f58-850c-6d58709fff97"
#     }
# end