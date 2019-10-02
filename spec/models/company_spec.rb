# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  name              :string
#  nip               :string
#  short_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let!(:company1) { create :company, id: 1, categories: [category1] }
  subject { described_class.new }

  describe 'associations' do
    it { is_expected.to have_one(:address) }
    it { is_expected.to have_many(:company_categories).dependent(:destroy) }
    it { is_expected.to have_many(:categories).through(:company_categories) }
    it { is_expected.to have_many(:company_pages).dependent(:destroy) }
    it { is_expected.to have_many(:company_files).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:categories) }
    it { is_expected.to validate_numericality_of(:nip) }
  end

  describe 'is owner?' do
    it { expect(company1.owner?(user)).to be true }
  end
end
