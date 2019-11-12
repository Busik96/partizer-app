# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string
#  nip                :string
#  notify_on_pt_added :boolean          default(FALSE)
#  short_description  :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
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
  belongs_to :user
  has_many_attached :photos

  accepts_nested_attributes_for :address

  validates :name, presence: true
  validates :nip, numericality: true, allow_blank: true
  validates :categories, presence: true
  validates :photos,
            content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            size: { less_than: 7.megabytes }

  def main_photo_url
    if photos.attached?
      Rails.application.routes.url_helpers.rails_blob_path(
        photos.first,
        only_path: true
      )
    else
      ActionController::Base.helpers.asset_pack_url('media/images/city.png')
    end
  end

  def owner?(user)
    return false if user.nil?

    user_id == user.id
  end
end
