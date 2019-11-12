# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyGuests
        class Base < Root
          namespace :party_guests do
            mount PartyGuests::Index
            mount PartyGuests::Create

            route_param :guest_id do
              helpers do
                def current_party_guest
                  @current_party_guest ||= current_party.party_guests.find(params[:guest_id])
                end
              end

              mount PartyGuests::Update
              mount PartyGuests::Remove
            end
          end
        end
      end
    end
  end
end
