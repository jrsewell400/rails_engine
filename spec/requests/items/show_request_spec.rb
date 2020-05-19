require 'rails_helper'

RSpec.describe 'Item API' do
  it 'can get an individual item' do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    response_data = JSON.parse(response.body)['data']
    expect(response_data['id'].to_i).to eq(item.id)
  end
end