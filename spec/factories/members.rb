FactoryBot.define do
  factory :member do
    email Faker::Internet.email
    password '123123'
    password_confirmation '123123'
  end
end
