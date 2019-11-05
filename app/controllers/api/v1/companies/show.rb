# frozen_string_literal: true

module API
  module V1
    module Companies
      class Show < Root
        desc 'Returns company details'
        get do
          ::Companies::DetailedSerializer.new(current_company, include: %i[address category])
        end
      end
    end
  end
end
