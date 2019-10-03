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

require 'rails_helper'

RSpec.describe PartyTemplate, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:party_template_elements) }
    it { is_expected.to have_many(:parties) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:description).is_at_most(250) }
  end
end
