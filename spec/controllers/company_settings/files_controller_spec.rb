# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanySettings::FilesController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let!(:company_file1) { create :company_file, company: company1 }
  let!(:company1) { create :company, id: 1, categories: [category1] }

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

      it 'assigns all company files to @files' do
        expect(assigns(:files).to_a).to eq([company_file1])
      end

      it 'create new file object' do
        expect(assigns(:new_file).attributes).to eq(company1.company_files.new.attributes)
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
        company_file: {
          name: name,
          file: fixture_file_upload(
            Rails.root.join('spec/support/files/test_file.txt'),
            'text/plain'
          )
        }
      }
    end

    context 'with valid attributes' do
      let(:name) { Faker::Company.name }

      it 'create new file' do
        expect { call }.to change(company1.company_files, :count).by(1)
      end

      it 'redirects to files index' do
        call
        expect(response).to redirect_to(company_settings_files_path)
      end
    end

    context 'with invalid attributes' do
      let(:name) { nil }

      it 'does not save the new file' do
        expect { call }.to_not change(company1.company_files, :count)
      end

      it 'redirects to index' do
        call
        expect(response).to redirect_to(company_settings_files_path)
      end
    end
  end

  describe 'DELETE files#destroy' do
    before do
      sign_in user
    end
    subject(:call) { delete :destroy, params: { company_id: company1.id, id: company_file1.id } }

    it 'remove file' do
      expect { call }.to change(company1.company_files, :count).by(-1)
    end

    it 'redirect to files index' do
      call
      expect(response).to redirect_to(company_settings_files_path)
    end
  end
end
