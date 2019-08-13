require 'rails_helper'

describe "Merchants API" do

  it "sends a list of items from specific merchant" do
    merch1 = Merchant.create!(name: "Yo-Yo ma")
    merch2 = Merchant.create!(name: "Ma-Ma yo")
    item1 = merch1.items.create!(name: "Toof brush", description: "It BRRRRRRRR", unit_price: 5)
    item2 = merch1.items.create!(name: "Weee WEE", description: "UWUUUU", unit_price: 7)
    item3 = merch2.items.create!(name: "NOO DONT", description: "OWOOOOO", unit_price: 7)


    get "/api/v1/merchants/#{merch1.id}/items"

    expect(response).to be_successful


    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
  end

  it "can get one specific item from merchant" do
    merch1 = Merchant.create!(name: "Yo-Yo ma")
    customer1 = Customer.create!(first_name: "Ma-Ma yo", last_name: "Frosties")

    invoice1 = merch1.invoices.create!(customer_id: customer1.id, status: "shipped")
    invoice2 = merch1.invoices.create!(customer_id: customer1.id, status: "shipped")


    get "/api/v1/merchants/#{merch1.id}/items/invoices"


    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice.count).to eq(2)
  end
end
