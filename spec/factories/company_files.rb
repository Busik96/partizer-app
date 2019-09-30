# frozen_string_literal: true

FactoryBot.define do
  factory :company_file do
    name { Faker::Military.navy_rank }
    file do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_file.txt'), 'text/plain')
    end
  end
end
