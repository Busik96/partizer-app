# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanySettings::PreferencesController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let!(:company1) { create :company, id: 1, categories: [category1] }

  describe 'GET preferences#show' do
    it_behaves_like 'only-for-signed-in', :show, company_id: 1

    context 'with signed in user' do
      before do
        sign_in user
        get :show, params: { company_id: company1.id }
      end

      it 'renders show view' do
        expect(response).to render_template('show')
      end

      it 'assigns current company to @company' do
        expect(assigns(:company)).to eq(company1)
      end
    end
  end

  describe 'PATCH preferences#update' do
    context 'with sign in user' do
      before do
        sign_in user
      end

      subject(:call) { patch :update, params: params }
      let(:params) do
        {
          company_id: company1.id,
          company: {
            notify_on_pt_added: notify_on_pt_added
          }
        }
      end

      describe 'when notify added' do
        let(:notify_on_pt_added) { true }

        it 'updates notify on pt' do
          call
          expect(company1.reload.notify_on_pt_added).to eq(true)
        end

        it 'returns flash message' do
          call
          expect(controller).to set_flash[:success]
        end

        it 'redirects to companies show' do
          call
          expect(response).to redirect_to(company_settings_preferences_path)
        end
      end
    end
  end
end
