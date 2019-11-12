# frozen_string_literal: true

FactoryBot.define do
  factory :party_guest do
    name { Faker::Name.name }
    party
  end
end
