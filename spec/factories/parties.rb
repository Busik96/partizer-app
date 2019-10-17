# frozen_string_literal: true

FactoryBot.define do
  factory :party do
    name { Faker::Company.name }
    start_date { Faker::Date.forward(days: 2) }
    end_date { Faker::Date.forward(days: 23) }

    after(:create) do |party|
      create :address, addressable: party
    end
  end
end
