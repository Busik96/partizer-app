# == Schema Information
#
# Table name: party_templates
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  settings    :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe PartyTemplate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
