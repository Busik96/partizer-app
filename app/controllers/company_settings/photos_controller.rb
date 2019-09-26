# frozen_string_literal: ture

module CompanySettings
  class PhotosController < BaseController
    before_action :find_photo, only: :destroy

    def index
      @photos = @company.photos.all
    end

    def create
      return protect_from_empty if params[:company].blank?

      if @company.photos.attach(photo_params[:photos])
        flash[:success] = 'Pomyślnie dodano'
      else
        flash[:error] = @company.errors[:photos].last
      end

      redirect_to action: :index
    end

    def destroy
      @photo.purge
      @photo.destroy
      flash[:success] = 'Zdjęcie zostało usunięte'
      redirect_to action: :index
    end

    private

    def find_photo
      @photo = @company.photos.find(params[:id])
    end

    def photo_params
      params.require(:company).permit(photos: [])
    end

    def protect_from_empty
      flash[:error] = 'No weź...dodaj jakieś zdjęcie :)'
      redirect_to action: :index
    end

    def load_company
      @company = current_user.companies.with_attached_photos.find(params[:company_id])
    end
  end
end
