# frozen_string_literal: true

module Companies
  class DetailedSerializer
    include FastJsonapi::ObjectSerializer

    set_type :company

    attributes :name, :nip, :short_description

    has_one :address
    has_many :categories
  end
end
