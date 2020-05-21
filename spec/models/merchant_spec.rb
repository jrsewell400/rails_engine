require 'rails_helper'

RSpec.describe Merchant, type: :model do 
  describe "relationships" do 
    it { should have_many :invoices }
    it { should have_many :items }
  end

  describe "validations" do 
    it { should validate_presence_of :name }
  end

  describe "class methods" do
    it "find_merchant" do
      merchant1 = create(:merchant, name: "Jordan's Storefront")
      merchant2 = create(:merchant, name: "Luna's Business")
      merchant3 = create(:merchant, name: "Nova's Shop")

      expect(Merchant.find_merchant("Storefront")).to eq(merchant1)
    end
  end
end