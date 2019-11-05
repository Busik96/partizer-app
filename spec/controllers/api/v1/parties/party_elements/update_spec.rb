# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::PartyElements::Update, type: :request do
  subject(:request) { patch url, params: params }

  let(:url) { "/api/v1/parties/#{party.id}/party_elements/#{element.id}" }
  let(:party) { create :party }
  let!(:element) { create :party_element, :with_company, party: party }
  let!(:company) { create :company }

  describe 'it updates given fields' do
    context 'when status and amount given' do
      let(:params) { { amount: '122', status: 'pending' } }

      it 'update correctlly' do
        request
        element.reload
        expect(element.amount).to eq(122.0)
        expect(element.status).to eq('pending')
      end

      it 'returns 200' do
        request
        expect(response.code).to eq('200')
      end
    end

    context 'when notes and company_id given' do
      let(:params) { { company_id: company.id, notes: 'hej' } }

      it 'update correctlly' do
        request
        element.reload
        expect(element.company_id).to eq(company.id)
        expect(element.notes).to eq('hej')
      end

      it 'returns 200' do
        request
        expect(response.code).to eq('200')
      end
    end
  end
end
