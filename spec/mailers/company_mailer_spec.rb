# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyMailer, type: :mailer do
  describe 'company_added_to_party' do
    let(:mail) { CompanyMailer.with(company: company).company_added_to_party }
    let(:company) { create :company }

    it 'renders the headers' do
      expect(mail.subject).to eq('Twoja firma została właśnie dodana do imprezy!')
      expect(mail.to).to eq([company.user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Witaj')
    end
  end
end
