# frozen_string_literal: true

module API
  module V1
    module Companies
      class Base < Root
        namespace :companies do
          mount Companies::Index

          route_param :id do
            helpers do
              def current_company
                @current_company ||= Company.find(params[:id])
              end
            end

            mount Companies::Show
          end
        end
      end
    end
  end
end
