# frozen_string_literal: true

# == Schema Information
#
# Table name: company_pages
#
#  id         :bigint           not null, primary key
#  menu_title :string
#  published  :boolean          default(FALSE)
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_company_pages_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

require 'rails_helper'

RSpec.describe CompanyPage, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:company) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
