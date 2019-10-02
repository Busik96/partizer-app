# frozen_string_literal: true

# == Schema Information
#
# Table name: company_files
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_company_files_on_company_id  (company_id)
#

FactoryBot.define do
  factory :company_file do
    name { Faker::Military.navy_rank }
    file do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_file.txt'), 'text/plain')
    end
  end
end
