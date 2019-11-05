# frozen_string_literal: true

module Addresses
  class DetailedSerializer
    include FastJsonapi::ObjectSerializer

    set_type :address

    attributes :address1, :address2, :city, :zipcode, :phone_number, :longitude, :latitude
  end
end
