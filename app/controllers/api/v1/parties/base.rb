# frozen_string_literal: true

module API
  module V1
    module Parties
      class Base < Root
        namespace :parties do
          route_param :id do
            helpers do
              def current_party
                @current_party ||= current_user.parties.includes(
                  :party_template,
                  party_elements: {
                    party_template_element: :categories,
                    company: %i[address categories photos_attachments photos_blobs]
                  }
                ).find(params[:id])
              end
            end

            mount Parties::Show
            mount PartyElements::Base
          end
        end
      end
    end
  end
end
