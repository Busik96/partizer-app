# frozen_string_literal: true

# == Schema Information
#
# Table name: party_templates
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  published   :boolean          default(FALSE)
#  settings    :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


FactoryBot.define do
  factory :party_template do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }

    trait :with_elements do
      after(:create) do |party_template|
        create_list :party_template_element, 2, party_template: party_template
      end
    end
  end
end
