FactoryBot.define do
  factory :meditation do
    name { Faker::Lorem.characters(number: 8) }
  
    trait :with_meditation do
      after(:build) do |meditation|
        meditation.meditationFile.attach(io: File.open('spec/files/sounds/test.mp3'), filename: 'test.mp3')
      end
    end
  end
end
