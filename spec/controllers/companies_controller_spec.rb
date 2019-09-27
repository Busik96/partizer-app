# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'GET companies#index' do
    let(:category1) { create :category }
    let(:category2) { create :category }
    let!(:company1) { create :company, categories: [category1] }
    let!(:company2) { create :company, categories: [category1, category2] }

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
end
