class Wallet < ApplicationRecord
  belongs_to :user
  has_many :coins, through: :coin_wallets

  #helpers

  def username
    self.user.try(:username)
  end
end
