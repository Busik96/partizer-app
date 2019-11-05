# frozen_string_literal: true

module PartyTemplates
  class SimpleSerializer
    include FastJsonapi::ObjectSerializer

    set_type :party_template

    attributes :name, :description
  end
end
