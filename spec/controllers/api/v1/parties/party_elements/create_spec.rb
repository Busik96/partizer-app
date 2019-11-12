# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::PartyElements::Create, type: :request do
  subject(:request) { post url, params: params, headers: headers }

  let(:url) { "/api/v1/parties/#{party.id}/party_elements" }
  let(:params) { {} }
  let(:party) { create :party, user_id: user.id }
  let(:user) { create :user }
  let(:headers) { { 'Authorization' => user.api_key } }

  context 'when params empty' do
    it 'returns 401' do
      request
      expect(response.code).to eq('400')
      expect(json_response_body['error']).to eq('company_id is missing')
    end
  end

  context 'when it has params' do
    let(:company) { create :company }
    let(:params) { { company_id: company.id } }

    it 'returns 201' do
      request
      expect(response.code).to eq('201')
      expect(json_response_body['data']['attributes']['company_id']).to eq(company.id)
    end

    it 'creates new party element' do
      expect { request }.to change(PartyElement, :count).by(1)
    end
  end
end
