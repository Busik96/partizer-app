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

class Party < ApplicationRecord
  has_one :address, as: :addressable
  belongs_to :party_template, optional: true
  has_many :party_elements
  has_many :party_guests

  validates :name, :start_date, :end_date, presence: true
end
