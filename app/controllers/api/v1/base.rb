# frozen_string_literal: true

module API
  module V1
    class Base < Root
      version 'v1', using: :path

      mount Companies::Base
      mount Parties::Base
    end
  end
end
