# == Schema Information
#
# Table name: party_template_elements
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  priority    :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe PartyTemplateElement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
