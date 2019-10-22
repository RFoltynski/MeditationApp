FactoryBot.define do
  factory :collection do
    name { Faker::Lorem.characters(number: 8) }
    description { Faker::Lorem.characters(number: 25) }
  end
end
