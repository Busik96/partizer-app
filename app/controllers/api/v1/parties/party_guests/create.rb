# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyGuests
        class Create < Base
          params do
            requires :name, type: String
          end
          post do
            guest = current_party.party_guests.create!(name: params[:name])
            status 201
            ::PartyGuests::DetailedSerializer.new(guest)
          end
        end
      end
    end
  end
end
