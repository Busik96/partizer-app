# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyElements
        class Update < Base
          params do
            optional :amount, type: String
            optional :company_id, type: Integer
            optional :status, type: String
            optional :notes, type: String
          end
          patch do
            current_party_element.update!(declared(params, include_missing: false))
            status 200
          end
        end
      end
    end
  end
end
