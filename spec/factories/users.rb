FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { '$tr0Ng;p@ssWord{42}' }
    password_confirmation { password }
  end
end
