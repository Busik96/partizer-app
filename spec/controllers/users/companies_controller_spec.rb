# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::CompaniesController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let(:category2) { create :category }
  let(:company1) { create :company, categories: [category1] }
  let!(:company2) { create :company, categories: [category1, category2] }

  describe 'GET companies#index' do
    it_behaves_like 'only-for-signed-in', :index

    context 'with signed in user' do
      before do
        sign_in user
        get :index
      end

      it 'renders index view' do
        expect(response).to render_template('index')
      end

      it 'assigns all companies to @companies' do
        expect(assigns(:companies)).to eq([company1])
      end
    end
  end
end
