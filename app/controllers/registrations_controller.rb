# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      clean_params = params.except(:password, :password_confirmation, :current_password)
      resource.update_without_password(clean_params)
    else
      super
    end
  end
end
