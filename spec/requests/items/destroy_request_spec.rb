require 'rails_helper'

RSpec.describe 'Item API' do
  it "can delete and item" do
    merchant = create(:merchant)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant)
    item3 = create(:item, merchant: merchant)
    
    expect(Item.all.count).to eq(3)

    delete "/api/v1/items/#{item3.id}"

    expect(response).to be_successful
    expect(Item.all.count).to eq(2)
    expect{ Item.find(item3.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end