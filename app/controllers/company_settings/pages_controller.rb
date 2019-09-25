# frozen_string_literal: true

module CompanySettings
  class PagesController < BaseController
    before_action :load_page, only: %i[edit update destroy]

    def index
      @pages = @company.company_pages.all
    end

    def new
      @page = @company.company_pages.new
    end

    def create
      @page = @company.company_pages.new(page_params)
      if @page.save
        flash[:success] = 'Pomyślnie utworzono podstronę'
        redirect_to company_settings_pages_path
      else
        flash[:error] = 'Chuj wi czemu podstrona nie została utworzona!'
        render 'new'
      end
    end

    def edit; end

    def update
      if @page.update(page_params)
        flash[:success] = 'Podstrona została zaktualizowana'
        redirect_to company_settings_pages_path
      else
        flash[:error] = 'Niestety coś poszło nie tak, spróbuj ponowanie.'
        render 'edit'
      end
    end

    def destroy
      @page.destroy
      flash[:error] = 'Podstrona została usunięta'
      redirect_to action: :index
    end

    private

    def load_page
      @page = @company.company_pages.find(params[:id])
    end

    def page_params
      params.require(:company_page).permit(:title, :menu_title, :content, :published)
    end
  end
end
