# frozen_string_literal: true

shared_examples 'only-for-signed-in' do |action|
  context 'without sign in' do
    it 'renders log in view' do
      get action
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
