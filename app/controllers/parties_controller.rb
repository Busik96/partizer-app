# frozen_string_literal: true

class PartiesController < ProtectedController
  def index
    @parties = current_user.parties
  end

  def new
    @party = current_user.parties.new
    @party.build_address
  end

  def create
    @party = current_user.parties.new(party_params)
    if @party.save
      flash[:success] = 'Pomyślnie stworzono impreze!'
      redirect_to parties_path
    else
      flash[:error] = 'Coś poszło nie tak!'
      render 'new'
    end
  end

  private

  def party_params
    params.require(:party).permit(
      :name, :start_date, :end_date,
      party_template_id: [],
      address_attributes: %i[id address1 address2 city zipcode phone_number]
    )
  end
end
