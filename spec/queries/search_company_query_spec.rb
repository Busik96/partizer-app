# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchCompanyQuery, type: :query do
  subject(:query) { described_class.new.call(collection, search_params) }

  let(:collection) { Company.all }
  let(:search_params) { {} }
  let!(:companies) { create_list :company, 2, :with_categories }

  context 'when search_params empty' do
    it { is_expected.to eq(collection) }
  end

  context 'when category_id given' do
    let(:search_params) { { category_id: companies.first.category_ids } }

    it { is_expected.to eq([companies.first]) }
  end

  context 'when query given' do
    context 'when searching by name' do
      let(:search_params) { { query: companies.first.name[0...5] } }

      it { is_expected.to eq([companies.first]) }
    end

    context 'when searching by NIP' do
      let(:search_params) { { query: companies.first.nip } }

      it { is_expected.to eq([companies.first]) }
    end

    context 'when searching by city' do
      let(:search_params) { { query: companies.first.address.city } }

      it { is_expected.to eq([companies.first]) }
    end
  end

  context 'when party_id given' do
    let(:party) { create :party }
    let!(:element) { create :party_element, party: party, company: companies.last }
    let(:search_params) { { party_id: party.id } }

    it { is_expected.to eq([companies.first]) }
  end

  context 'when party_element_id given' do
    let(:party) { create :party }
    let!(:element) do
      create(
        :party_element,
        party: party
      )
    end
    let(:search_params) { { party_element_id: element.id } }

    context 'when party element has party_template_element' do
      let(:party_template_element) do
        create :party_template_element, category_ids: companies.first.category_ids
      end
      before do
        element.update(party_template_element: party_template_element)
      end

      it { is_expected.to eq([companies.first]) }
    end

    context 'when party_elements has not party_template_element' do
      it { is_expected.to eq(collection) }
    end
  end
end
