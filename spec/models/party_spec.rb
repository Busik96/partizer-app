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

require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:party_template).optional }
    it { is_expected.to have_many(:party_elements) }
    it { is_expected.to have_many(:party_guests) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end
end
