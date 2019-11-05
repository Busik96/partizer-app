# frozen_string_literal: true

module API
  module V1
    module Parties
      class Show < Base
        desc 'Returns party details'
        get do
          ::Parties::DetailedSerializer.new(
            current_party,
            include: %i[
              address
              party_template
              party_elements
              party_elements.company
              party_elements.company.address
              party_elements.party_template_element
              party_elements.party_template_element.categories
            ]
          )
        end
      end
    end
  end
end
