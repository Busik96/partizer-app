# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::PartyGuests::Index, type: :request do
  subject(:request) { get url, headers: headers }

  let(:url) { "/api/v1/parties/#{party.id}/party_guests/" }
  let(:party) { create :party, user_id: user.id }
  let!(:guest1) { create :party_guest, party: party }
  let!(:guest2) { create :party_guest, party: party }
  let!(:guest3) { create :party_guest, party: party }
  let(:user) { create :user }
  let(:headers) { { 'Authorization' => user.api_key } }

  describe 'it returns the guest list' do
    it 'returns json correctlly' do
      request
      expect(json_response_body['data'].size).to eq(party.party_guests.size)
    end

    it 'returns 200' do
      request
      expect(response.code).to eq('200')
    end
  end
end
