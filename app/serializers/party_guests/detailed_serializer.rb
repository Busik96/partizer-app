# frozen_string_literal: true

module PartyGuests
  class DetailedSerializer
    include FastJsonapi::ObjectSerializer

    set_type :party_guests

    attributes :name, :confirmed

  end
end
