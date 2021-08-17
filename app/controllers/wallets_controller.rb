class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show, :update, :destroy]

  # GET /wallets
  # def index use if user has multiple wallets
  #   @wallets = Wallet.all

  #   render json: WalletSerializer.new(@wallets)
  # end

  # GET /wallets/1
  # def show
  #   render json: @wallet.slice(:id, :name, :total_usd_value, :initial_value, :current_value, :user_id, :username)
  # end

  # POST /wallets
  def create
    @wallet = current_user.build_wallet(wallet_params)

    if @wallet.save
      render json: @wallet, status: :created, location: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wallets/1
  def update
    if @wallet.update(wallet_params)
      render json: @wallet.slice(:id, :name, :total_usd_value, :initial_value, :current_value, :user_id, :username)
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wallets/1
  def destroy
    @wallet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wallet_params
      params.require(:wallet).permit(:name, :total_usd_value, :initial_value, :current_value, :user_id)
    end
end
