# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyGuests
        class Index < Base
          get do
            guest = current_party.party_guests
            status 200
            ::PartyGuests::DetailedSerializer.new(guest)
          end
        end
      end
    end
  end
end
