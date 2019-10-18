# frozen_string_literal: true

module Companies
  class SimpleSerializer
    include FastJsonapi::ObjectSerializer

    set_type :company

    attributes :name, :nip, :short_description

    attribute :main_photo do |company|
      Rails.application.routes.url_helpers.rails_blob_path(company.photos.first, only_path: true) if company.photos.any?
    end
  end
end
