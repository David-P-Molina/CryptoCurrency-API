class CoinSerializer
  include JSONAPI::Serializer
  attributes :name, :symbol, :initial_value, :day, :week, :marketcap, :volume_quantity, :volume_price, :circulation, :api_id
end
