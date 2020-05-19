require 'rails_helper'

RSpec.describe 'Item API' do
  it "can create an item" do
    merchant = create(:merchant)

    post "/api/v1/items", params: 
        { name: "PipBoy 3000",
          description: "A personal information processor",
          unit_price: "3000.00",
          merchant_id: "#{merchant.id}"
        }

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    item = json[:data][:attributes]

    new_item = Item.last

    expect(new_item.name).to eq(item[:name])
    expect(new_item.description).to eq(item[:description])
    expect(new_item.unit_price).to eq(item[:unit_price])
    expect(new_item.merchant_id).to eq(item[:merchant_id])
  end
end