# frozen_string_literal: true

module PartyTemplateElements
  class DetailedSerializer
    include FastJsonapi::ObjectSerializer

    set_type :party_template_element

    attributes :name, :description, :priority
    has_many :categories, serializer: CategorySerializer
  end
end
