# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PartiesController, type: :controller do
  let(:user) { create :user, parties: [party1, party2] }
  let(:party1) { create :party }
  let(:party2) { create :party }

  describe 'GET parties#index' do
    it_behaves_like 'only-for-signed-in', :index

    context 'with signed in user' do
      before do
        sign_in user
        get :index
      end

      it 'renders index view' do
        expect(response).to render_template('index')
      end

      it 'assigns all parties to @party' do
        expect(assigns(:parties).to_a).to eq([party1, party2])
      end
    end
  end

  describe 'GET parties#new' do
    it_behaves_like 'only-for-signed-in', :new

    context 'with signed in user' do
      before do
        sign_in user
        get :new
      end

      it 'renders new view' do
        expect(response).to render_template('new')
      end

      it 'creates a new party object' do
        expect(assigns(:party).attributes).to eq(user.parties.new.attributes)
      end

      it 'builds address' do
        expect(assigns(:party).address).not_to be_nil
      end
    end
  end

  describe 'POST users/parties#create' do
    context 'with sign in user' do
      before do
        sign_in user
      end

      subject(:call) { post :create, params: params }
      let(:params) do
        {
          party: {
            name: name,
            start_date: Faker::Date.backward(days: 14),
            end_date: Faker::Date.forward(days: 22),
            address_attributes: {
              address1: Faker::Address.street_address,
              city: Faker::Address.city,
              zipcode: Faker::Address.zip
            }
          }
        }
      end
      let(:last_party) { Party.last }

      context 'with valid attributes' do
        let(:name) { Faker::Company.name }

        it 'creates a new party' do
          expect { call }.to change(Party, :count).by(1)
        end

        it 'redirects to party edit' do
          call
          expect(response).to redirect_to(edit_party_path(last_party.id))
        end
      end

      context 'with invalid attributes' do
        let(:name) { nil }

        it 'does not save the new user company' do
          expect { call }.to_not change(Party, :count)
        end

        it 're-renders the new method' do
          call
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe 'GET parties#edit' do
    it_behaves_like 'only-for-signed-in', :edit, id: 2

    context 'with signed in user' do
      before do
        sign_in user
        get :edit, params: { id: party1.id }
      end

      it 'renders edit view' do
        expect(response).to render_template('edit')
      end

      it 'assigns current party id to @party_id' do
        expect(assigns(:party_id)).to eq(party1.id.to_s)
      end

      it 'assigns all categories to @categories' do
        expect(assigns(:categories).class).to eq(Array)
      end

      it 'assigns current url to @current_url' do
        expect(assigns(:current_url)).to eq(edit_party_path(id: party1.id))
      end
    end
  end

  describe 'DELETE parties#destroy' do
    before do
      sign_in user
    end
    subject(:call) { delete :destroy, params: { id: party1.id } }

    it 'remove party' do
      expect { call }.to change(Party, :count).by(-1)
    end

    it 'redirect to parties index' do
      call
      expect(response).to redirect_to(parties_path)
    end
  end
end
