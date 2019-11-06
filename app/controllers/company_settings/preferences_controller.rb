# frozen_string-literal: true

module CompanySettings
  class PreferencesController < BaseController
    def show; end

    def update
      if @company.update(company_params)
        flash[:success] = 'Pomyślnie zaktualizowano dane!'
        redirect_to company_settings_preferences_path
      else
        flash[:error] = 'Coś poszło nie tak!'
        render 'show'
      end
    end

    private

    def company_params
      params.require(:company).permit(
        :notify_on_pt_added
      )
    end
  end
end
