FactoryBot.define do
  factory :meditation do
    name { Faker::Lorem.characters(number: 8) }
    trait :with_attachments do
      after(:build) do |meditation|
        meditation.meditationFile.attach(io: File.open('spec/files/sounds/test.mp3'), filename: 'test.mp3')
      end
    end
    collection_id {32}
  end
end
