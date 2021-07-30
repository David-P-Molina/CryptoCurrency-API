class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :name
      t.float :total_usd_value
      t.float :initial_value
      t.float :current_value
      t.references :user

      t.timestamps
    end
  end
end
