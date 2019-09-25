# frozen_string_literal: true

module CompanySettings
  class BasicsController < BaseController
    def show; end

    def update
      if @company.update(company_params)
        flash[:success] = 'Pomyślnie zaktualizowano dane!'
        redirect_to users_companies_path
      else
        flash[:error] = 'Coś poszło nie tak!'
        render 'show'
      end
    end

    def destroy
      @company.destroy
      flash[:error] = 'Cytując Prezesa, jeśli nie potrafisz w obecnych warunkach utrzymać
      firmy to nie nadajesz się by być przedsiębiorcą!'
      redirect_to users_companies_path
    end

    private

    def company_params
      params.require(:company).permit(
        :name, :nip, :short_description,
        category_ids: [],
        address_attributes: %i[id address1 address2 city zipcode phone_number]
      )
    end
  end
end
