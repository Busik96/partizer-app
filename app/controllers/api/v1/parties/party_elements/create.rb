# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyElements
        class Create < Base
          params do
            requires :company_id, type: Integer
          end
          post do
            element = current_party.party_elements.create!(company_id: params[:company_id])
            status 201
            ::PartyElements::SimpleSerializer.new(element)
          end
        end
      end
    end
  end
end
