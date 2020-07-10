FactoryBot.define do
  factory :comment do
    user { FactoryBot.create(:user) }
    article { FactoryBot.create(:article, user: user) }
    content { Faker::Lorem.sentence(word_count: 10) }
  end
end
