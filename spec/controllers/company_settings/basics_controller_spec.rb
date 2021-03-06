# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanySettings::BasicsController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let(:category2) { create :category }
  let!(:company1) { create :company, id: 1, categories: [category1] }
  let!(:company2) { create :company, id: 2, categories: [category1, category2] }

  describe 'GET basics#show' do
    it_behaves_like 'only-for-signed-in', :show, company_id: 1

    context 'with signed in user' do
      before do
        sign_in user
        get :show, params: { company_id: company1.id }
      end

      it 'renders show view' do
        expect(response).to render_template('show')
      end

      it 'assigns all users companies to @company' do
        expect(assigns(:company)).to eq(company1)
      end
    end
  end

  describe 'PATCH basics#update' do
    context 'with sign in user' do
      before do
        sign_in user
      end

      subject(:call) { patch :update, params: params }
      let(:params) do
        {
          company_id: company1.id,
          company: {
            name: name,
            nip: nip,
            category_ids: [category1.id],
            address_attributes: {
              id: company1.address.id,
              address1: Faker::Address.street_address,
              city: Faker::Address.city,
              zipcode: Faker::Address.zip
            }
          }
        }
      end

      context 'with valid attributes' do
        let(:name) { Faker::Company.name }
        let(:nip) { Faker::Company.polish_taxpayer_identification_number }

        it 'updates user company' do
          call
          expect(company1.reload.nip).to eq(nip)
        end

        it 'redirects to companies show' do
          call
          expect(response).to redirect_to(users_companies_path)
        end
      end

      context 'with invalid attributes' do
        let(:name) { nil }
        let(:nip) { Faker::Company.polish_taxpayer_identification_number }

        it 'does not save the new company params' do
          expect { call }.not_to change(company1, :name)
        end

        it 're-renders the show method' do
          call
          expect(response).to render_template(:show)
        end
      end
    end
  end

  describe 'DELETE basics#destroy' do
    before do
      sign_in user
    end
    subject(:call) { delete :destroy, params: { company_id: company1.id } }

    it 'remove company' do
      expect { call }.to change(Company, :count).by(-1)
    end

    it 'redirect to companies index' do
      call
      expect(response).to redirect_to(users_companies_path)
    end
  end
end
