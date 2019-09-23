# frozen_string_literal: true

class HomeController < ApplicationController
  rescue_from ActionView::MissingTemplate, with: :error_render_method

  def index; end

  def static_page
    render params[:page]
  end

  private

  def error_render_method
    raise ActionController::RoutingError, 'Not Found'
  end
end
