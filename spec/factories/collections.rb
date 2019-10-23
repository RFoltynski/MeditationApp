FactoryBot.define do
  factory :collection do |f|
    f.name { Faker::Name.first_name }
    f.description { Faker::Lorem.characters(number: 25)}
  end
  factory :invalid_collection, parent: :collection do |f|
    f.name { ' ' }
  end
end
