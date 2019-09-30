# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'home#index'

  resources :companies, only: [:index, :show] do
    scope module: 'company_settings' do
      resource :settings, only: [:show] do
        resource :basics
        resources :pages
        resources :photos
        resources :files
      end
    end
  end

  namespace :users do
    resources :companies, only: [:index, :new, :create]
  end

  #get '*page', to: 'home#static_page', as: :static_page
end
