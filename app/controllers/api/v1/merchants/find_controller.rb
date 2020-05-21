class Api::V1::Merchants::FindController < ApplicationController
  def show
    merchant = Merchant.find_merchant(params[:name])
    render json: MerchantSerializer.new(merchant)
  end
end