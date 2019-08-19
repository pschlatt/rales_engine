class Api::V1::Merchants::RevenueController < ApplicationController

def show
  single_merchant = Merchant.find(params[:id])
  # binding.pry
  render json: MerchantSerializer.new(single_merchant.total_revenue)

end

end
