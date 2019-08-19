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


    expect(items["data"].count).to eq(2)
  end

  it "can get one specific item from merchant" do
    merch1 = Merchant.create!(name: "Yo-Yo ma")
    customer1 = Customer.create!(first_name: "Ma-Ma yo", last_name: "Frosties")

    invoice1 = merch1.invoices.create!(customer_id: customer1.id, status: "shipped")
    invoice2 = merch1.invoices.create!(customer_id: customer1.id, status: "shipped")


    get "/api/v1/merchants/#{merch1.id}/invoices"


    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["data"].count).to eq(2)
  end

  it "can get one specific merchant" do
    merch1 = Merchant.create!(name: "Yo-Yo ma")
    merch2 = Merchant.create!(name: "Ma-Ma yo")
    merch3 = Merchant.create!(name: "Who's your momma")

    get "/api/v1/merchants/#{merch3.id}"


    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq(merch3.name)
  end

  it "can grab all merchants" do
    merch1 = Merchant.create!(name: "Yo-Yo ma")
    merch2 = Merchant.create!(name: "Ma-Ma yo")
    merch3 = Merchant.create!(name: "Who's your momma")
    merch4 = Merchant.create!(name: "Brutus from Julius Caesar")

    get "/api/v1/merchants"


    merchants = JSON.parse(response.body)

    expect(response).to be_successful

    merchants["data"].each do |merchant|
      expect(merchant["type"]).to eq("merchant")
    end
  end

end
