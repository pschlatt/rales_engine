class Api::V1::Merchants::SearchController < ApplicationController

  def index

    render json: MerchantSerializer.new(Merchant.where(merchant_parameters))

  end

  def show

    render json: MerchantSerializer.new(Merchant.where(merchant_parameters).first)

  end

  private

  def merchant_parameters
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
