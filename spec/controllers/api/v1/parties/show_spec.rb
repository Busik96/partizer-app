# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Parties::Show, type: :request do
  subject(:request) { get url }

  let(:url) { "/api/v1/parties/#{party.id}" }
  let!(:party) { create :party, :complete }

  describe 'it returns party details' do
    let(:correct_attributes) do
      {
        'name' => party.name,
        'start_date' => party.start_date.to_s,
        'end_date' => party.end_date.to_s
      }
    end
    let(:associated_objects) { json_response_body['included'].map { |el| el['type'] }.uniq }

    it 'returns party details correctly' do
      request
      expect(json_response_body['data']['attributes']).to eq(correct_attributes)
    end

    it 'returns associated data correctly' do
      request
      expect(associated_objects).to include(
        'address',
        'party_template_element', 'category',
        'party_element', 'company'
      )
    end

    it 'returns code 200' do
      request
      expect(response.code).to eq('200')
    end
  end
end
