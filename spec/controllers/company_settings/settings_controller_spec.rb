# frozen_string_literal:true

RSpec.describe CompanySettings::SettingsController, type: :controller do
  let(:user) { create :user, companies: [company1] }
  let(:category1) { create :category }
  let!(:company1) { create :company, id: 1, categories: [category1] }

  describe 'GET settings#show' do
    it_behaves_like 'only-for-signed-in', :show, company_id: 1

    context 'with signed in user' do
      before do
        sign_in user
        get :show, params: { company_id: company1.id }
      end

      it 'renders index view' do
        expect(response).to render_template('show')
      end
    end
  end
end
