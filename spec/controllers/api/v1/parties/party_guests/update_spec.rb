# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::PartyGuests::Update, type: :request do
  subject(:request) { patch url, params: params, headers: headers }

  let(:url) { "/api/v1/parties/#{party.id}/party_guests/#{guest.id}" }
  let(:party) { create :party, user_id: user.id }
  let!(:guest) { create :party_guest, party: party }
  let(:user) { create :user }
  let(:headers) { { 'Authorization' => user.api_key } }

  describe 'it updates given fields' do
    context 'when confirmed and name given' do
      let(:params) { { name: Faker::Name.name, confirmed: true } }

      it 'update correctlly' do
        request
        guest.reload
        expect(guest.name).to eq(params[:name])
        expect(guest.confirmed).to eq(true)
      end

      it 'returns 200' do
        request
        expect(response.code).to eq('200')
      end
    end
  end
end
