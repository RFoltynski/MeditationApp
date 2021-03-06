FactoryBot.define do
  factory :user do
    nick { Faker::Lorem.characters(number: 8) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    admin { false }
    
    trait :with_avatar do
      after(:build) do |user|
        user.avatar.attach(io: File.open('spec/files/images/avatar.png'), filename: 'attachment.png', content_type: 'image/png')
      end
    end
  end
  
  factory :userAdmin do
    nick { Faker::Lorem.characters(number: 8) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    admin { true }
    
    trait :with_avatar do
      after(:build) do |user|
        user.avatar.attach(io: File.open('spec/files/images/avatar.png'), filename: 'attachment.png', content_type: 'image/png')
      end
    end
  end
end
