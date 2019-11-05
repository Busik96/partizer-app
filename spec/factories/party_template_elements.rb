# frozen_string_literal: true

# == Schema Information
#
# Table name: party_template_elements
#
#  id                :bigint           not null, primary key
#  description       :string
#  name              :string
#  priority          :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  party_template_id :bigint
#
# Indexes
#
#  index_party_template_elements_on_party_template_id  (party_template_id)
#

FactoryBot.define do
  factory :party_template_element do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    party_template

    after(:create) do |pte|
      pte.categories = create_list :category, 2 if pte.categories.blank?
    end
  end
end
