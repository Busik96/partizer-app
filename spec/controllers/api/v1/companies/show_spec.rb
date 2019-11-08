# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Companies::Show, type: :request do
  subject(:request) { get url, headers: headers }

  let(:url) { "/api/v1/companies/#{company.id}" }
  let!(:company) { create :company, :with_categories }
  let(:user) { create :user }
  let(:headers) { { 'Authorization' => user.api_key } }

  describe 'it returns company details' do
    let(:correct_attributes) do
      {
        'name' => company.name,
        'nip' => company.nip,
        'short_description' => company.short_description
      }
    end
    let(:associated_objects) { json_response_body['included'].map { |el| el['type'] }.uniq }

    it 'returns party details correctly' do
      request
      expect(json_response_body['data']['attributes']).to eq(correct_attributes)
    end

    it 'returns associated objects correctly' do
      request
      expect(associated_objects).to include(
        'address'
      )
    end

    it 'returns categories details correctly' do
      request
      expect(json_response_body['data']['relationships']['categories'])
    end

    it 'returns code 200' do
      request
      expect(response.code).to eq('200')
    end
  end
end
