# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET dashboard#index' do
    let(:user) { create :user }

    context 'with sign in' do
      it 'renders index view' do
        sign_in user
        get :index
        expect(response).to render_template('index')
      end
    end

    it_behaves_like 'only-for-signed-in', :index
  end
end
