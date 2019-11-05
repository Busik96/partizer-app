# frozen_string_literal: true

module Parties
  class DetailedSerializer
    include FastJsonapi::ObjectSerializer

    set_type :party

    attributes :name, :start_date, :end_date

    has_one :address, serializer: Addresses::DetailedSerializer
    belongs_to :party_template, serializer: PartyTemplates::SimpleSerializer
    has_many :party_elements, serializer: PartyElements::DetailedSerializer
  end
end
