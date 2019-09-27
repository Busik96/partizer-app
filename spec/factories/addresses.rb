# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    zipcode { Faker::Address.zip }

    trait :for_company do
      association(:addressable, factory: :company)
    end
  end
end
