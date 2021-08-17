class AddDayWeekVolumeMarketcapAndCirculatingToCoin < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :day, :float
    add_column :coins, :week, :float
    add_column :coins, :marketcap, :integer, :limit => 8
    add_column :coins, :volume_quantity, :integer, :limit => 8
    add_column :coins, :volume_price, :float
    add_column :coins, :circulation, :integer, :limit => 8
    add_column :coins, :api_id, :integer
  end
end
