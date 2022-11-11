# frozen_string_literal: true

RSpec.shared_context 'with a logged in user' do
  let(:current_user_password) { 'current-user-password' }
  let(:current_user) { create(:user, password: current_user_password) }

  before do
    post log_in_path, params: { email: current_user.email, password: current_user_password }
  end
end
