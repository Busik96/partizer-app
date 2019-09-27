# frozen_string_literal: true

# == Schema Information
#
# Table name: company_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  company_id  :bigint           not null
#
# Indexes
#
#  index_company_categories_on_category_id  (category_id)
#  index_company_categories_on_company_id   (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (company_id => companies.id)
#

require 'rails_helper'

RSpec.describe CompanyCategory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:category) }
  end
end
