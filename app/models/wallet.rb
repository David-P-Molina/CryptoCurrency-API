class Wallet < ApplicationRecord
  belongs_to :user
  has_many :coins, through :coin_wallets
end
