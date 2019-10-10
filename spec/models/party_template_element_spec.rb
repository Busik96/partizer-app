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

require 'rails_helper'

RSpec.describe PartyTemplateElement, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:party_template) }
    it { is_expected.to have_many(:party_template_element_categories) }
    it { is_expected.to have_many(:categories).through(:party_template_element_categories) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:description).is_at_most(250) }
  end
end
