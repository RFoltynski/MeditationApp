FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { create(:user) }
    meditation { create(:meditation) }
  end
end
