FactoryBot.define do
  factory :article do
    title { 'My first amazing article' }
    content { 'Lorem ipsum' }
    is_draft { true }
    user { FactoryBot.create(:user) }
  end
end
