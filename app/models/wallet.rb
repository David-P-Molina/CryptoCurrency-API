class Wallet < ApplicationRecord
  belongs_to :user
  has_many :coins, through :coin_wallets

  #helpers

  def username=(username)
    self.username = User.find_or_create_by(username: username)
  end

  def username
    self.user.try(:username)
  end
end
