# frozen_string_literal: true

# == Schema Information
#
# Table name: party_template_element_categories
#
#  id                        :bigint           not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  category_id               :bigint           not null
#  party_template_element_id :bigint           not null
#
# Indexes
#
#  pte_category_id                (category_id)
#  pte_party_template_element_id  (party_template_element_id)
#
# Foreign Keys
#
#  pk_pte_category  (category_id => categories.id)
#  pk_pte_ele       (party_template_element_id => party_template_elements.id)
#

class PartyTemplateElementCategory < ApplicationRecord
  belongs_to :category
  belongs_to :party_element
end
