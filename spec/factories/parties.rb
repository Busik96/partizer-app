# frozen_string_literal: true

# == Schema Information
#
# Table name: parties
#
#  id                :bigint           not null, primary key
#  end_date          :date
#  name              :string
#  start_date        :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  party_template_id :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_parties_on_party_template_id  (party_template_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_template_id => party_templates.id)
#

FactoryBot.define do
  factory :party do
    name { Faker::Company.name }
    start_date { Faker::Date.backward(days: 14) }
    end_date { Faker::Date.forward(days: 23) }

    after(:create) do |party|
      create :address, addressable: party
    end

    trait :complete do
      after(:create) do |party|
        create_list :party_element, 2, :with_company, :with_template, party: party
      end
    end
  end
end
