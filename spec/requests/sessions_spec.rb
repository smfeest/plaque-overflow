# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'sessions#new' do
    it 'renders the log in form' do
      get log_in_path

      expect(response.body).to include 'Log in'
    end

    it "responds with a 'Success' HTTP response status" do
      get log_in_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'sessions#create' do
    let!(:user) { User.create!(name: 'Nadja Wendell', email: 'nadja.wendell@example.com', password: 'nadjas-password') }

    let(:post_create) { post log_in_path, params: }

    context 'when valid credentials are supplied' do
      let(:params) { { email: 'nadja.wendell@example.com', password: 'nadjas-password' } }

      it 'logs in the user' do
        post_create

        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to the root path' do
        post_create

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when no user exists with the email address supplied' do
      let(:params) { { email: 'not.nadja@example.com', password: 'nadjas-password' } }

      it 're-renders the log in form with an alert message' do
        post_create

        expect(response.body).to include 'The email address or password you entered is incorrect'
      end

      it "has an 'Unprocessable Entity' HTTP response status" do
        post_create

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the supplied password is incorrect' do
      let(:params) { { email: 'nadja.wendell@example.com', password: 'not-nadjas-password' } }

      it 're-renders the log in form with an alert message' do
        post_create

        expect(response.body).to include 'The email address or password you entered is incorrect'
      end

      it "has an 'Unprocessable Entity' HTTP response status" do
        post_create

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'sessions#destroy' do
    it 'logs out the user' do
      delete log_out_path

      expect(session[:user_id]).to be_nil
    end

    it 'redirects to the root path' do
      delete log_out_path

      expect(response).to redirect_to(root_path)
    end
  end
end
