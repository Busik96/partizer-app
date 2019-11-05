# frozen_string_literal: true

module PartyElements
  class SimpleSerializer
    include FastJsonapi::ObjectSerializer

    set_type :party_element

    attributes :company_id
  end
end
