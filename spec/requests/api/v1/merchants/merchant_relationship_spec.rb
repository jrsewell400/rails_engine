require 'rails_helper'

describe 'Merchant and Item Relatioship' do
  it 'can return all items for a specific merchant' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    create_list(:item, 10, merchant: merchant1)
    create_list(:item, 5, merchant: merchant2)

    get "/api/v1/merchants/#{merchant1.id}/items"

    expect(response).to be_successful
    
    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].length).to eq(10)
    expect(items[:data].length).to_not eq(5)
  end
end
