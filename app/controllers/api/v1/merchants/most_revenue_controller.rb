class Api::V1::Merchants::MostRevenueController < ApplicationController

  def show

    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity]))

  end

end
