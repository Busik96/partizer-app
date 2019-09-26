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
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#

class Company < ApplicationRecord
  has_one :address, as: :addressable
  has_many :company_categories, dependent: :destroy
  has_many :categories, through: :company_categories
  has_many :company_pages, dependent: :destroy
  has_many :company_files, dependent: :destroy
  has_many_attached :photos

  accepts_nested_attributes_for :address

  validates :name, presence: true
  validates :categories, presence: true
  validates :photos,
            attached: true,
            content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            size: { less_than: 7.megabytes }
end
