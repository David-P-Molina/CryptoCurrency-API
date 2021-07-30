class CoinSerializer
  include JSONAPI::Serializer
  attributes :name, :symbol, :initial_value, :current_value
end
