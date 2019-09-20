# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'home#index'

  get '*page', to: 'home#static_page', as: :static_page
end
