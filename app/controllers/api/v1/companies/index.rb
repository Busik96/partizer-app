# frozen_string_literal: true

module API
  module V1
    module Companies
      class Index < Root
        desc 'Returns list of companies'
        params do
          optional :category_id, type: Integer
          optional :query, type: String
        end
        get do
          search_params = declared(params)
          companies = SearchCompanyQuery.new.call(Company.all, search_params)
          ::Companies::SimpleSerializer.new(companies)
        end
      end
    end
  end
end
