# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyElements
        class Base < Root
          namespace :party_elements do
            mount PartyElements::Create

            route_param :element_id do
              helpers do
                def current_party_element
                  @current_party_element ||= current_party.party_elements.find(params[:element_id])
                end
              end

              mount PartyElements::Update
              mount PartyElements::Remove
            end
          end
        end
      end
    end
  end
end
