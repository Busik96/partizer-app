# frozen_string_literal: true

module PartyElements
  class DetailedSerializer
    include FastJsonapi::ObjectSerializer

    set_type :party_element

    attributes :amount, :notes, :status, :company_id

    belongs_to(
      :party_template_element,
      serializer: PartyTemplateElements::DetailedSerializer
    )

    has_one(
      :company,
      serializer: Companies::SimpleSerializer
    )
  end
end
