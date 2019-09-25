# frozen_string_literal: true

# == Schema Information
#
# Table name: company_pages
#
#  id         :bigint           not null, primary key
#  menu_title :string
#  published  :boolean          default(FALSE)
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

class CompanyPage < ApplicationRecord
  belongs_to :company
  has_rich_text :content
end
