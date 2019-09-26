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
  pending "add some examples to (or delete) #{__FILE__}"
end
