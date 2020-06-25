FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "john#{n}@doe.com" }
    first_name { 'John ' }
    last_name { 'Doe' }
    password { '$tr0Ng;p@ssWord{42}' }
    password_confirmation { '$tr0Ng;p@ssWord{42}' }
  end
end
