# frozen_string_literal: true

# == Schema Information
#
# Table name: party_elements
#
#  id                        :bigint           not null, primary key
#  amount                    :float
#  notes                     :string
#  status                    :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  company_id                :bigint
#  party_id                  :bigint           not null
#  party_template_element_id :bigint
#
# Indexes
#
#  index_party_elements_on_company_id                 (company_id)
#  index_party_elements_on_party_id                   (party_id)
#  index_party_elements_on_party_template_element_id  (party_template_element_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (party_id => parties.id)
#  fk_rails_...  (party_template_element_id => party_template_elements.id)
#


class PartyElement < ApplicationRecord
  belongs_to :party
  belongs_to :company, optional: true
  belongs_to :party_template_element, optional: true
end
