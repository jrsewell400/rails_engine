require 'rails_helper'

RSpec.describe 'Item API' do
  it 'returns all items' do
    create_list(:item, 5)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(5)
  end
end