FactoryBot.define do
  factory :customer, aliases: [:user] do

    transient do
      upcased false
    end

    name { Faker::Name.name }
    # email { Faker::Internet.email }

    sequence(:email) { |n| "email#{n}@email.com"  }

    trait :female do
      gender 'F'
    end

    trait :male do
      gender 'M'
    end

    factory :customer_vip do
      vip true
      days_to_pay 30
    end

    factory :customer_free do
      vip false
      days_to_pay 15
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
