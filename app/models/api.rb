url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
key = "?CMC_PRO_API_KEY=fcde9892-d0e8-4f58-850c-6d58709fff97"
limiter = "&start=1&limit=2&convert=USD"
coins_response = HTTParty.get("#{url + key + limiter}")

# class Api
#     include HTTParty
#     base_uri = 'https://pro-api.coinmarketcap.com'
#     headers = {
#         CMC_PRO_API_KEY="+"fcde9892-d0e8-4f58-850c-6d58709fff97"
#     }
# end