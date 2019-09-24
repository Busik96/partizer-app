# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :preload_data

  def index
    @companies = SearchCompanyQuery.new.call(Company.all, search_params)
  end

  private

  def preload_data
    @categories = Category.all
    @search_params = search_params
  end

  def search_params
    params.permit(:query, :category_id) || {}
  end
end
