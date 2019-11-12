# frozen_string_literal: true

# module PartyTemplates
#   class DetailedSerializer
#     include FastJsonapi::ObjectSerializer

#     set_type :party_template

#     attributes :name, :description

#     has_many :party_template_elements, serializer: ::PartyTemplateElements::DetailedSerializer
#     has_many :parties, serializer: ::Parties::DetailedSerializer
#   end
# end
