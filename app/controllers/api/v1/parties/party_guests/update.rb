# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyGuests
        class Update < Base
          params do
            optional :name, type: String
            optional :confirmed, type: Boolean
          end
          patch do
            current_party_guest.update!(declared(params, include_missing: false))
            status 200
          end
        end
      end
    end
  end
end
