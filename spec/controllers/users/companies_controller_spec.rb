# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::CompaniesController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let(:category2) { create :category }
  let(:company1) { create :company, categories: [category1] }
  let!(:company2) { create :company, categories: [category1, category2] }

  describe 'GET users/companies#index' do
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
        expect(assigns(:companies).to_a).to eq([company1])
      end
    end
  end

  describe 'GET users/companies#new' do
    it_behaves_like 'only-for-signed-in', :new

    context 'with signed in user' do
      before do
        sign_in user
        get :new
      end

      it 'renders new view' do
        expect(response).to render_template('new')
      end

      it 'creates a new company object' do
        expect(assigns(:company).attributes).to eq(user.companies.new.attributes)
      end

      it 'builds address' do
        expect(assigns(:company).address).not_to be_nil
      end
    end
  end

  describe 'POST users/company#create' do
    context 'with sign in user' do
      before do
        sign_in user
      end

      subject(:call) { post :create, params: params }
      let(:params) do
        {
          company: {
            name: name,
            category_ids: [category1.id],
            address_attributes: {
              address1: Faker::Address.street_address,
              city: Faker::Address.city,
              zipcode: Faker::Address.zip
            }
          }
        }
      end

      context 'with valid attributes' do
        let(:name) { Faker::Company.name }

        it 'creates a new user company' do
          expect { call }.to change(Company, :count).by(1)
        end

        it 'redirects to companies index' do
          call
          expect(response).to redirect_to(users_companies_path)
        end
      end

      context 'with invalid attributes' do
        let(:name) { nil }

        it 'does not save the new user company' do
          expect { call }.to_not change(Company, :count)
        end

        it 're-renders the new method' do
          call
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
