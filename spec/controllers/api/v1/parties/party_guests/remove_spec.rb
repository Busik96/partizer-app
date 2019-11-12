# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::PartyGuests::Remove, type: :request do
  subject(:request) { delete url, headers: headers }

  let(:url) { "/api/v1/parties/#{party.id}/party_guests/#{guest.id}" }
  let(:party) { create :party, user_id: user.id }
  let(:user) { create :user }
  let(:headers) { { 'Authorization' => user.api_key } }

  describe 'when party guest destroy correctlly' do
    let!(:guest) { create :party_guest, party: party }

    it 'remove party guest' do
      expect { request }.to change(PartyGuest, :count).by(-1)
    end

    it 'returns 200' do
      request
      expect(response.code).to eq('200')
    end
  end
end
