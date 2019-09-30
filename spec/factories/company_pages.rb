# frozen_string_literal: true

FactoryBot.define do
  factory :company_page do
    title { Faker::Company.industry }
    menu_title { Faker::Company.industry }
    content { Faker::Lorem.paragraph }
  end
end
