# frozen_string_literal: true

module CompanySettings
  class FilesController < BaseController
    before_action :find_file, only: :destroy

    def index
      @files = @company.company_files.all
      @new_file = @company.company_files.new
    end

    def create
      if @company.company_files.create(file_params)
        flash[:success] = 'Pomyślnie dodano plik'
        redirect_to action: :index
      else
        flash[:error] = 'Coś poszło nie tak. Spróbuj za rok.'
        render 'index'
      end
    end

    def destroy
      @file.destroy
      flash[:error] = 'Pomyślnie usunięto plik'
      redirect_to action: :index
    end

    private

    def find_file
      @file = @company.company_files.find(params[:id]) if params[:id]
    end

    def file_params
      params.require(:company_file).permit(:name, :file)
    end
  end
end
