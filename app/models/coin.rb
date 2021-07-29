class Coin < ApplicationRecord
    has_many :wallets, through :coin
end
