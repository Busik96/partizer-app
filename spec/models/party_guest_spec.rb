# frozen_string_literal: true

# == Schema Information
#
# Table name: party_guests
#
#  id         :bigint           not null, primary key
#  confirmed  :boolean          default(FALSE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  party_id   :bigint           not null
#
# Indexes
#
#  index_party_guests_on_party_id  (party_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_id => parties.id)
#

require 'rails_helper'

RSpec.describe PartyGuest, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:party) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
