# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Companies::Index, type: :request do
  subject(:request) { get url, params: params, headers: headers }

  let(:url) { '/api/v1/companies' }
  let(:params) { {} }
  let!(:companies) { create_list :company, 2, :with_categories }
  let(:company_ids) { json_response_body['data'].map { |el| el['id'].to_i } }
  let(:user) { create :user }
  let(:headers) { { 'Authorization' => user.api_key } }

  it 'returns list of companies' do
    request
    expect(response.code).to eq('200')
    expect(json_response_body['data'].size).to eq(companies.size)
  end

  describe 'search' do
    context 'with selected categories' do
      let(:params) { { category_id: companies.first.category_ids } }

      it 'returns companies for given category' do
        request
        expect(company_ids).to include(companies.first.id)
        expect(company_ids).not_to include(companies.last.id)
      end
    end

    context 'with query provided' do
      let(:params) { { query: companies.last.name } }

      it 'returns companies for given query' do
        request
        expect(company_ids).to include(companies.last.id)
        expect(company_ids).not_to include(companies.first.id)
      end
    end
  end

  describe 'pagination' do
    describe 'headers' do
      it 'returns proper headers' do
        request
        expect(response.headers['current-page']).to eq('1')
        expect(response.headers['total']).to eq('2')
        expect(response.headers['per-page']).to eq('10')
      end

      context 'when per-page passed' do
        let(:params) { { per_page: 9 } }

        it 'return proper headers' do
          request
          expect(response.headers['per-page']).to eq('9')
        end
      end
    end

    describe 'content' do
      let(:params) { { per_page: 1, page: 2 } }

      it 'returns proper companies' do
        request
        expect(company_ids).to include(companies.last.id)
        expect(company_ids).not_to include(companies.first.id)
      end
    end
  end
end
