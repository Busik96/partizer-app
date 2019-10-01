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

class CompanyPage < ApplicationRecord
  extend FriendlyId

  belongs_to :company
  has_rich_text :content

  validates :title, presence: true

  friendly_id :page_title, use: :scoped, scope: :company

  def page_title
    menu_title.presence || title
  end
end
