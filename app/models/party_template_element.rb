# frozen_string_literal: true

# == Schema Information
#
# Table name: party_template_elements
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  priority    :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class PartyTemplateElement < ApplicationRecord
  belongs_to :party_template
  has_many :party_element_categories
  has_many :categories, through: :party_element_categories
end
