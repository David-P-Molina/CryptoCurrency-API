class AddDayWeekVolumeMarketcapAndCirculatingToCoin < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :day, :float
    add_column :coins, :week, :float
    add_column :coins, :marketcap, :integer
    add_column :coins, :volume_quantity, :integer
    add_column :coins, :volume_price, :float
    add_column :coins, :circulation, :integer
  end
end
