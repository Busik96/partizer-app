# frozen_string_literal: true

module API
  module V1
    module Parties
      module PartyElements
        class Remove < Base
          delete do
            if current_party_element.party_template_element.present?
              current_party_element.update!(amount: nil, company_id: nil, status: nil)
            else
              current_party_element.destroy!
            end
            status 200
          end
        end
      end
    end
  end
end
