FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    meditation { nil }
  end
end
