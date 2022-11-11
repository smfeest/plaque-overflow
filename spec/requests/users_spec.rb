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
  end

  describe 'users#create' do
    let(:user_params) { { name: 'Bob', email: 'bob@example.com', password: 'a-really-secure-password' } }
    let(:post_create) { post register_path, params: { user: user_params } }

    it 'creates and logs in the user' do
      post_create

      user = User.find_by(name: 'Bob', email: 'bob@example.com')

      expect(session[:user_id]).to eq(user.id)
    end

    it 'redirects to the root path' do
      post_create

      expect(response).to redirect_to(root_path)
    end

    context 'when the form contains invalid attributes' do
      let(:user_params) { { name: 'A' * 500, email: 'bob@example.com', password: 'a-really-secure-password' } }

      it 're-renders the registration form with the error summary' do
        post_create

        expect(response.body).to include 'Name is too long'
      end

      it "has an 'Unprocessable Entity' HTTP response status" do
        post_create

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
