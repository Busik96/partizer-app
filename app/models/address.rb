# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  address1         :string
#  address2         :string
#  addressable_type :string
#  city             :string
#  latitude         :float
#  longitude        :float
#  phone_number     :string
#  zipcode          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint
#
# Indexes
#
#  index_addresses_on_addressable_type_and_addressable_id  (addressable_type,addressable_id)
#

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  # validations
  validates :address1, :city, :zipcode, presence: true
end
