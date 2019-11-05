# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PartyServices::SetupTemplate, type: :services do
  subject(:service) { described_class.new.call(party) }

  let(:party_template) { create :party_template, :with_elements }
  let(:party) { create :party, party_template: party_template }

  context 'when party create with template' do
    it 'creates party_elements' do
      expect { service }.to change(PartyElement, :count).by(party_template.party_template_elements.count)
    end
  end

  context 'when party created without template' do
    let(:party_template) { nil }

    it { is_expected.to eq(nil) }
  end
end
