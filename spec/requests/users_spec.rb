# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  describe 'users#new' do
    it 'renders the registration form' do
      get register_path

      expect(response.body).to include 'Register'
    end

    it "responds with a 'Success' HTTP response status" do
      get register_path

      expect(response).to have_http_status(:success)
    end

    context 'when the user is already logged in' do
      include_context 'with a logged in user'

      it 'redirects to the root path' do
        get register_path

        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'users#create' do
    let(:email) { 'bob@example.com' }
    let(:user_params) { { name: 'Bob', email:, password: 'a-really-secure-password' } }
    let(:post_create) { post register_path, params: { user: user_params } }

    it 'creates and logs in the user' do
      post_create

      user = User.find_by(email:)

      expect(session[:user_id]).to eq(user.id)
    end

    it 'redirects to the root path' do
      post_create

      expect(response).to redirect_to(root_path)
    end

    context 'when the form contains invalid attributes' do
      let(:user_params) { { name: 'A' * 500, email:, password: 'a-really-secure-password' } }

      it 're-renders the registration form with the error summary' do
        post_create

        expect(response.body).to include 'Name is too long'
      end

      it "has an 'Unprocessable Entity' HTTP response status" do
        post_create

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the email address has already been registered' do
      before do
        create(:user, email:)
      end

      it 'redirects to the log in page' do
        post_create

        expect(response).to redirect_to(log_in_path(email:))
      end

      it 'sets an alert message advising the user to log in instead' do
        post_create

        expect(flash[:alert]).to include 'You’ve already registered with that email address'
      end
    end
  end
end
