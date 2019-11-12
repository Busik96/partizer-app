# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::PartyGuests::Create, type: :request do
  subject(:request) { post url, params: params, headers: headers }

  let(:url) { "/api/v1/parties/#{party.id}/party_guests" }
  let(:params) { {} }
  let(:party) { create :party, user_id: user.id }
  let(:user) { create :user }
  let(:headers) { { 'Authorization' => user.api_key } }

  context 'when params empty' do
    it 'returns 401' do
      request
      expect(response.code).to eq('400')
      expect(json_response_body['error']).to eq('name is missing')
    end
  end

  context 'when it has params' do
    let(:params) { { name: Faker::Name.name } }

    it 'returns 201' do
      request
      expect(response.code).to eq('201')
      expect(json_response_body['data']['attributes']['name']).to eq(party.party_guests.last.name)
    end

    it 'creates new party guest' do
      expect { request }.to change(PartyGuest, :count).by(1)
    end
  end
end
