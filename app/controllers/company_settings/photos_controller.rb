# frozen_string_literal: ture

module CompanySettings
  class PhotosController < BaseController
    before_action :find_photo, only: :destroy

    def index
      @photos = @company.photos.all
    end

    def create
      if params[:company].blank?
        flash[:error] = 'No weź...dodaj jakieś zdjęcie :)'
        redirect_to action: :index
        return
      end

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
  end
end
