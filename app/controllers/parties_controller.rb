# frozen_string_literal: true

class PartiesController < ProtectedController
  def index
    @pagy, @parties = pagy(current_user.parties)
  end

  def new
    @party = current_user.parties.new
    @party.build_address
  end

  def edit
    @party_id = params[:id]
    @current_url = edit_party_path(id: @party_id)
    @categories = Category.all.map { |cat| { id: cat.id, value: cat.name } }
    @token = current_user.api_key
  end

  def create
    @party = current_user.parties.new(party_params)
    if @party.save
      PartyServices::SetupTemplate.new.call(@party)
      redirect_to edit_party_path(@party)
    else
      flash[:error] = 'Coś poszło nie tak!'
      render 'new'
    end
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    flash[:success] = "Poprawnie usuneliśmy impreze! #{@party.name}"
    redirect_to parties_path
  end

  private

  def party_params
    params.require(:party).permit(
      :name, :start_date, :end_date,
      :party_template_id,
      address_attributes: %i[id address1 address2 city zipcode phone_number]
    )
  end
end
