class WalletSerializer
  include JSONAPI::Serializer
  attributes :total_usd_value, :user_id, :username, :name, :symbol, :initial_value, :current_value
end
