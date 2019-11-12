# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyGuests
        class Remove < Base
          delete do
            current_party_guest.destroy!
            status 200
          end
        end
      end
    end
  end
end
