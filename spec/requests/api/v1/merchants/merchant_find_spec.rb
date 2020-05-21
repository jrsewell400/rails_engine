require 'rails_helper'

RSpec.describe "Merchant Find Endpoint" do 
  it "can find a merchant using their name, case-insensitive" do
    merchant1 = create(:merchant, name: "Jordan's Storefront")
    merchant2 = create(:merchant, name: "Luna's Business")
    merchant3 = create(:merchant, name: "Nova's Shop")

    get "/api/v1/merchants/find?name=#{merchant1.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["attributes"]["name"]).to eq("Jordan's Storefront")
    expect(merchant["id"]).to eq("#{merchant1.id}")
  end

  it "will only list the first merchant if multiple matches" do
    merchant1 = create(:merchant, name: "Jordan's Storefront")
    merchant2 = create(:merchant, name: "Luna's Business")
    merchant3 = create(:merchant, name: "Nova's Shop")
    merchant4 = create(:merchant, name: "Storefront's Shop")

    get "/api/v1/merchants/find?name=#{merchant1.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["attributes"]["name"]).to eq("Jordan's Storefront")
    expect(merchant["id"]).to eq("#{merchant1.id}")
    expect(merchant["attributes"]["name"]).to_not eq("Storefront's Shop")
    expect(merchant["id"]).to_not eq("#{merchant4.id}")
  end
end