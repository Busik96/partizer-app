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

class CompanyFile < ApplicationRecord
  belongs_to :company
  has_one_attached :file

  validates :file, presence: true, size: { less_than: 15.megabytes }
  validates :name, presence: true
end
