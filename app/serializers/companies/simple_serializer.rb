# frozen_string_literal: true

module Companies
  class SimpleSerializer
    include FastJsonapi::ObjectSerializer

    set_type :company

    has_one :address, serializer: Addresses::DetailedSerializer
    has_many :categories

    attributes :name, :nip, :short_description, :main_photo_url
  end
end
