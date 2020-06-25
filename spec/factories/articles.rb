FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 10) }
    content { Faker::ChuckNorris.fact }
    is_draft { true }
    user { FactoryBot.create(:user) }
  end
end
