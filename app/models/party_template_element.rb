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

class PartyTemplateElement < ApplicationRecord
  belongs_to :party_template
  has_many :party_template_element_categories
  has_many :categories, through: :party_template_element_categories

  validates :name, presence: true
  validates :description, length: { maximum: 250 }
end
