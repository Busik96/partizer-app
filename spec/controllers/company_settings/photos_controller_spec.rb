# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanySettings::PhotosController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let!(:company1) { create :company, :with_photos, id: 1, categories: [category1] }

  describe 'GET files#index' do
    it_behaves_like 'only-for-signed-in', :index, company_id: 1

    context 'with signed in user' do
      before do
        sign_in user
        get :index, params: { company_id: company1.id }
      end

      it 'renders index view' do
        expect(response).to render_template('index')
      end

      it 'assigns all company photos to @photos' do
        expect(assigns(:photos).to_a).to eq(company1.photos.to_a)
      end
    end
  end

  describe 'POST files#create' do
    before do
      sign_in user
    end

    subject(:call) { post :create, params: params }
    let(:params) do
      {
        company_id: company1.id,
        company: {
          photos: [
            fixture_file_upload(
              Rails.root.join('spec/support/files/photo.jpg'),
              'image/jpeg'
            ),
            fixture_file_upload(
              Rails.root.join('spec/support/files/photo.jpg'),
              'image/jpeg'
            )
          ]
        }
      }
    end

    context 'with valid attributes' do
      it 'creates new photo files' do
        expect { call }.to change(company1.photos, :count).by(2)
      end

      it 'redirects to photos index' do
        call
        expect(response).to redirect_to(company_settings_photos_path)
      end
    end

    context 'with blank attribute' do
      let(:params) { { company_id: company1.id, company: nil } }

      it 'does not save blank attribute' do
        expect { call }.to_not change(company1.photos, :count)
      end

      it 'redirects to index' do
        call
        expect(response).to redirect_to(company_settings_photos_path)
      end
    end

    context 'with invalite attribute type' do
      let(:params) do
        {
          company_id: company1.id,
          company: {
            photos: [
              fixture_file_upload(
                Rails.root.join('spec/support/files/test_file.txt'),
                'text/plain'
              )
            ]
          }
        }
      end

      it 'does not save invalid attributes' do
        expect { call }.to_not change(company1.photos, :count)
      end

      it 'redirects to index' do
        call
        expect(response).to redirect_to(company_settings_photos_path)
      end
    end
  end

  describe 'DELETE photos#destroy' do
    before do
      sign_in user
    end
    subject(:call) { delete :destroy, params: { company_id: company1.id, id: company1.photos.first.id } }

    it 'remove photo' do
      expect { call }.to change(company1.photos, :count).by(-1)
    end

    it 'redirect to photos index' do
      call
      expect(response).to redirect_to(company_settings_photos_path)
    end
  end
end
