# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  name              :string
#  nip               :string
#  short_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#

class Company < ApplicationRecord
  has_one :address, as: :addressable
  has_many :company_categories
  has_many :category, through: :company_categories

  accepts_nested_attributes_for :address

  validates :name, presence: true
end
