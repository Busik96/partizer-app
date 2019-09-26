# frozen_string_literal: true

module Users
  class CompaniesController < ProtectedController
    before_action :set_company, only: %i[update]

    def index
      @companies = current_user.companies
    end

    def new
      @company = current_user.companies.new
      @company.build_address
    end

    def create
      @company = current_user.companies.new(company_params)
      if @company.save
        flash[:success] = 'Pomyślnie założono firmę!'
        redirect_to users_companies_path
      else
        flash[:error] = 'Coś poszło nie tak!'
        render 'new'
      end
    end

    private

    def company_params
      params.require(:company).permit(
        :name, :nip, :short_description,
        category_ids: [],
        address_attributes: %i[id address1 address2 city zipcode phone_number]
      )
    end

    def set_company
      @company = current_user.companies.find(params[:id])
    end
  end
end
