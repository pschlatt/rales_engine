class Api::V1::Merchants::FaveCustomerController < ApplicationController


def show

  render json: CustomerSerializer.new(Merchant.favorite_customer(params[:id]))
end


end
