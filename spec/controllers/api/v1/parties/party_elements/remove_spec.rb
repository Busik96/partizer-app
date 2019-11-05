# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::PartyElements::Remove, type: :request do
  subject(:request) { delete url }

  let(:url) { "/api/v1/parties/#{party.id}/party_elements/#{element.id}" }
  let(:party) { create :party }

  context 'when party element created from party template element' do
    let!(:element) { create :party_element, :with_company, :with_template, party: party }

    it 'does not remove party template' do
      expect { request }.not_to change(PartyElement, :count)
    end

    it 'clears party template details' do
      request
      element.reload
      expect(element.company_id).to be_nil
      expect(element.amount).to be_nil
      expect(element.status).to be_nil
    end

    it 'returns 200' do
      request
      expect(response.code).to eq('200')
    end
  end

  context 'when party element created without party template' do
    let!(:element) { create :party_element, :with_company, party: party }

    it 'remove party template' do
      expect { request }.to change(PartyElement, :count).by(-1)
    end

    it 'returns 200' do
      request
      expect(response.code).to eq('200')
    end
  end
end
