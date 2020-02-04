# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PartyServices::CreateElement, type: :services do
  subject(:service) { described_class.new.call(party, company.id) }

  let(:party) { create :party, :complete }
  let(:company) { party.party_elements.first.company }

  describe 'when party element create with company' do
    it 'creates party_element corectlly' do
      expect { service }.to change(PartyElement, :count)
    end

    context 'when company have notifications enabled' do
      before do
        company.update!(notify_on_pt_added: true)
      end

      it 'sends notify to user' do
        expect { service }.to have_enqueued_job.on_queue('mailers')
      end
    end

    context 'when company have notifications disabled' do
      it 'does not notify user' do
        expect { service }.not_to have_enqueued_job.on_queue('mailers')
      end
    end
  end
end
