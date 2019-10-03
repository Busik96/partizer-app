# frozen_string_literal: true

# == Schema Information
#
# Table name: parties
#
#  id                :bigint           not null, primary key
#  end_date          :date
#  name              :string
#  start_date        :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  party_template_id :bigint
#
# Indexes
#
#  index_parties_on_party_template_id  (party_template_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_template_id => party_templates.id)
#

require 'rails_helper'

RSpec.describe Party, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
