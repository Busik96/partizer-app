# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanySettings::PagesController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let!(:company_page1) { create :company_page, company: company1 }
  let!(:company1) { create :company, id: 1, categories: [category1] }

  describe 'GET pages#index' do
    it_behaves_like 'only-for-signed-in', :index, company_id: 1

    context 'with signed in user' do
      before do
        sign_in user
        get :index, params: { company_id: company1.id }
      end

      it 'renders index view' do
        expect(response).to render_template('index')
      end

      it 'assigns all company pages to @pages' do
        expect(assigns(:pages).to_a).to eq([company_page1])
      end
    end
  end

  describe 'GET pages#new' do
    it_behaves_like 'only-for-signed-in', :new, company_id: 1

    context 'with signed in user' do
      before do
        sign_in user
        get :new, params: { company_id: company1.id }
      end

      it 'renders new view' do
        expect(response).to render_template('new')
      end

      it 'creates a new page object' do
        expect(assigns(:page).attributes).to eq(company1.company_pages.new.attributes)
      end
    end
  end

  describe 'POST pages#create' do
    before do
      sign_in user
    end

    subject(:call) { post :create, params: params }
    let(:params) do
      {
        company_id: company1.id,
        company_page: {
          title: title,
          menu_title: Faker::Company.industry,
          content: Faker::Lorem.paragraph
        }
      }
    end

    context 'with valid attributes' do
      let(:title) { Faker::Company.industry }

      it 'create new page' do
        expect { call }.to change(company1.company_pages, :count).by(1)
      end

      it 'redirects to page index' do
        call
        expect(response).to redirect_to(company_settings_pages_path)
      end
    end

    context 'with invalid attributes' do
      let(:title) { nil }

      it 'does not save the new page' do
        expect { call }.to_not change(company1.company_pages, :count)
      end

      it 're-render new view' do
        call
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET pages#edit' do
    context 'with signed in user' do
      before do
        sign_in user
        get :edit, params: { company_id: company1.id, id: company_page1.id }
      end

      it 'renders edit view' do
        expect(response).to render_template('edit')
      end

      it 'assigns users company page to @page' do
        expect(assigns(:page)).to eq(company_page1)
      end
    end
  end

  describe 'PATCH pages#update' do
    context 'with sign in user' do
      before do
        sign_in user
      end

      subject(:call) { patch :update, params: params }
      let(:params) do
        {
          company_id: company1.id,
          id: company_page1.id,
          company_page: {
            title: title,
            menu_title: Faker::Company.industry,
            content: Faker::Lorem.paragraph
          }
        }
      end

      context 'with valid attributes' do
        let(:title) { Faker::Company.industry }

        it 'updates user company page' do
          call
          expect(company_page1.reload.title).to eq(title)
        end

        it 'redirects to company pages index' do
          call
          expect(response).to redirect_to(company_settings_pages_path)
        end
      end

      context 'with invalid attributes' do
        let(:title) { nil }

        it 'does not save the new company params' do
          expect { call }.not_to change(company_page1, :title)
        end

        it 're-renders the edit method' do
          call
          expect(response).to render_template(:edit)
        end
      end
    end
  end

  describe 'DELETE pages#destroy' do
    before do
      sign_in user
    end
    subject(:call) { delete :destroy, params: { company_id: company1.id, id: company_page1.id } }

    it 'remove file' do
      expect { call }.to change(company1.company_pages, :count).by(-1)
    end

    it 'redirect to pages index' do
      call
      expect(response).to redirect_to(company_settings_pages_path)
    end
  end
end
