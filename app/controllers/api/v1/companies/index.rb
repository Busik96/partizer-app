# frozen_string_literal: true

module API
  module V1
    module Companies
      class Index < Root
        desc 'Returns list of companies'
        params do
          optional :category_id, type: Array[Integer]
          optional :party_element_id, type: Integer
          optional :party_id, type: Integer
          optional :query, type: String
        end
        paginate
        get do
          search_params = declared(params)
          companies = paginate(
            SearchCompanyQuery.new.call(
              Company.includes(:address).all,
              search_params
            )
          )
          ::Companies::SimpleSerializer.new(companies, include: %i[address])
        end
      end
    end
  end
end
