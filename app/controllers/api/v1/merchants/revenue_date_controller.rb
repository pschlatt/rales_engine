class Api::V1::Merchants::RevenueDateController < ApplicationController


  def index
    look_up = Merchant.most_revenue_by_date(params[:date])

      render json: {"data" => {"attributes" => {'total_revenue' => "%.2f" % (look_up.to_f / 100)}}}
  end

  
end
