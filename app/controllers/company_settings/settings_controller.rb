# frozen_string_literal: true

module CompanySettings
  class SettingsController < BaseController
    before_action :find_company

    def show; end

    private

    def find_company
      @company = Company.find(params[:company_id]) if params[:company_id]
    end
  end
end
