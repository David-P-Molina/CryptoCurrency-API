class CreateCoinWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :coin_wallets do |t|
      t.references :coin, null: false, foreign_key: true
      t.referrences :wallet

      t.timestamps
    end
  end
end
