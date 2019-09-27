# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:company_categories) }
    it { is_expected.to have_many(:companies).through(:company_categories) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
