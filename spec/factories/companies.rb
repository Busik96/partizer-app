# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    categories { create_list :category, 1 }

    after(:create) do |company|
      create :address, addressable: company
    end
  end
end
