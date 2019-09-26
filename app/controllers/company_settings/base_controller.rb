# frozen_string_literal: true

module CompanySettings
  class BaseController < ProtectedController
    layout 'company_settings'
    before_action :load_company

    private

    def load_company
      @company = current_user.companies.find(params[:company_id])
    end
  end
end
