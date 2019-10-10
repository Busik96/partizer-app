# frozen_string_literal: true

# == Schema Information
#
# Table name: party_templates
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  published   :boolean          default(FALSE)
#  settings    :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PartyTemplate < ApplicationRecord
  has_many :party_template_elements
  has_many :parties

  validates :name, presence: true
  validates :description, length: { maximum: 250 }
end
