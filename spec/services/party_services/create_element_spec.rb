# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PartyServices::CreateElement, type: :services do
  subject(:service) { described_class.new.call(party, company_id) }

  let(:party) { create :party, :complete }
  let(:company_id) { party.party_elements.first.company.id }

  describe 'when party element create with company' do
    it 'creates party_element corectlly' do
      expect { service }.to change(PartyElement, :count)
    end
  end
end
