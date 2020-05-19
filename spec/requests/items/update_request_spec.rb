require 'rails_helper'

RSpec.describe 'Item API' do
  it "can update the name of a current item" do
    item = create(:item)
    original_name = Item.last.name
    original_description = Item.last.description

    patch "/api/v1/items/#{item.id}", params: 
        { name: "Mjolnir", 
          description: "Beside Thor, Chuck Norris is the only person who can wield Mjolnir" 
        }

    updated_item = Item.find_by(id: item.id)

    expect(response).to be_successful
    expect(updated_item.name).to eq("Mjolnir")
    expect(updated_item.description).to eq("Beside Thor, Chuck Norris is the only person who can wield Mjolnir")
    expect(updated_item.name).to_not eq(original_name)
    expect(updated_item.name).to_not eq(original_description)
  end
end

