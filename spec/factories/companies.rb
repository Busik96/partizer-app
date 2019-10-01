# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  name              :string
#  nip               :string
#  short_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#

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
