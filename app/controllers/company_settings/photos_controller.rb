# frozen_string_literal: ture

module CompanySettings
  class PhotosController < BaseController
    before_action :find_photo, only: :destroy

    def index
      @photos = @company.photos.all
    end

    def create
      @company.photos.attach(photo_params[:photos])
      redirect_to action: :index
    end

    def destroy
      @photo.purge
      @photo.destroy
      flash[:error] = 'Zdjęcie zostało usunięte'
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
