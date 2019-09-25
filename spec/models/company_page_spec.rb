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

require 'rails_helper'

RSpec.describe CompanyPage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
