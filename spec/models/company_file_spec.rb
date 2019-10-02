# frozen_string_literal: true

# == Schema Information
#
# Table name: company_files
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_company_files_on_company_id  (company_id)
#

require 'rails_helper'

RSpec.describe CompanyFile, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:company) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:file) }
  end
end
