require 'rails_helper'

describe "Merchants API" do
  it "sends a list of items from specific merchant" do
    create_list(:item, 3)

    get '/api/v1/merchants/:id/items'

    expect(response).to be_successful
  end
end
