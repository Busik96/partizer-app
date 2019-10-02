# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:category1) { create :category }
  let(:category2) { create :category }
  let!(:company_page1) { create :company_page, company: company1 }
  let!(:company1) { create :company, :with_photos, categories: [category1] }
  let!(:company2) { create :company, categories: [category1, category2] }

  describe 'GET companies#index' do
    context 'without search' do
      before { get :index }

      it 'renders index view' do
        expect(response).to render_template('index')
      end

      it 'assigns all companies to @companies' do
        expect(assigns(:companies)).to eq([company1, company2])
      end
    end

    context 'with search params' do
      before { get :index, params: params }
      let(:params) { {} }

      describe 'query search' do
        let(:params) { { query: company1.name[0..5] } }

        it 'assigns search_params properly' do
          expect(assigns(:search_params)[:query]).to eq(params[:query])
        end

        it 'assigns proper company to companies' do
          expect(assigns(:companies)).to eq([company1])
        end
      end

      describe 'category filter' do
        let(:params) { { category_id: category2.id.to_s } }

        it 'assigns search_params properly' do
          expect(assigns(:search_params)[:category_id]).to eq(params[:category_id])
        end

        it 'assigns proper company to companies' do
          expect(assigns(:companies)).to eq([company2])
        end
      end
    end
  end

  describe 'GET companies#show' do
    before { get :show, params: { id: company1.id } }
    it 'redirect to basic view' do
      expect(response).to redirect_to(basics_company_path)
    end
  end

  describe 'GET companies#basics' do
    before do
      get :basics, params: { id: company1.id }
    end

    it 'renders basics view' do
      expect(response).to render_template('basics')
    end

    it 'assigns all company photos to @photos' do
      expect(assigns(:photos).to_a).to eq(company1.photos.to_a)
    end
  end

  describe 'GET companies#files' do
    before do
      get :files, params: { id: company1.id }
    end

    it 'renders basics view' do
      expect(response).to render_template('files')
    end

    it 'assigns all company files to @files' do
      expect(assigns(:files).to_a).to eq(company1.company_files.to_a)
    end
  end

  describe 'GET companies#show_page' do
    before do
      get :show_page, params: { id: company1.id, page: company_page1 }
    end

    it 'renders show_page view' do
      expect(response).to render_template('show_page')
    end

    it 'assigns comapny page to @page' do
      expect(assigns(:page)).to eq(company_page1)
    end
  end
end
