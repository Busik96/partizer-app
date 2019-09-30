# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    categories { create_list :category, 1 }

    after(:create) do |company|
      create :address, addressable: company
    end

    trait :with_photos do
      photos do
        [
          Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/photo.jpg'), 'image/jpeg'),
          Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/photo.jpg'), 'image/jpeg')
        ]
      end
    end
  end
end
