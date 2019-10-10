# frozen_string_literal: true

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


class PartyTemplate < ApplicationRecord
  has_many :party_elements
end
