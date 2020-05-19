FactoryBot.define do
  factory :item do
    name { Faker::Games::ElderScrolls.name }
    description { Faker::ChuckNorris.fact }
    unit_price { Faker::Commerce.price }
    association :merchant
  end
end