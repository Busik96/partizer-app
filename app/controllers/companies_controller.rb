# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :preload_data
  before_action :search_company, only: %i[basics files show_page]
  before_action :search_pages, only: %i[basics files show_page]

  def index
    @pagy, @companies = pagy(SearchCompanyQuery.new.call(Company.all, search_params), items: 12)
  end

  def show
    redirect_to basics_company_path
  end

  def basics
    @photos = @company.photos.all
  end

  def files
    @files = @company.company_files.all
  end

  def show_page
    @page = @company.company_pages.friendly.find(params[:page])
  end

  private

  def preload_data
    @categories = Category.all
    @search_params = search_params
  end

  def search_params
    params.permit(:query, :category_id) || {}
  end

  def search_company
    @company = Company.find(params[:id])
  end

  def search_pages
    @pages = @company.company_pages.all
  end
end
