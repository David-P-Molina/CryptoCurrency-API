class CoinsController < ApplicationController
  
  before_action :set_coin, only: [:show, :update, :destroy]

  # GET /coins
  def index
    @coins = Coin.all

    render json: CoinSerializer.new(@coins)
  end

  # GET /coins/1
  def show
    render json: @coin.slice(:name, :symbol, :initial_value, :day, :week, :marketcap, :volume_quantity, :volume_price, :circulation, :api_id)
  end

  # POST /coins
  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      render json: @coin, status: :created, location: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coins/1
  def update
    if @coin.update(coin_params)
      render json: @coin.slice(:name, :symbol, :initial_value, :day, :week, :marketcap, :volume_quantity, :volume_price, :circulation, :updated_at, :api_id)
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coins/1
  def destroy
    @coin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:name, :symbol, :initial_value, :day, :week, :marketcap, :volume_quantity, :volume_price, :circulation, :updated_at, :api_id)
    end
end
