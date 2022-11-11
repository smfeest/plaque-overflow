# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questions' do
  describe 'questions#show' do
    let(:question) { create(:question) }

    it 'renders the question' do
      get question_path(question)

      expect(response.body).to include question.title
    end

    it "responds with a 'Success' HTTP response status" do
      get question_path(question)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'questions#new' do
    it 'renders the registration form' do
      get new_question_path

      expect(response.body).to include 'Ask a question'
    end

    it "responds with a 'Success' HTTP response status" do
      get new_question_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'question#create' do
    let(:title) { 'Why is the sky blue?' }
    let(:question_params) { { title:, body: 'Is it because the clouds contain water?' } }
    let(:question) { Question.find_by(title:) }
    let(:post_create) { post questions_path, params: { question: question_params } }

    context 'when the user is logged in' do
      include_context 'with a logged in user'

      it 'sets the current user as the author' do
        post_create

        expect(question.author).to eq current_user
      end

      it 'redirects to the question' do
        post_create

        expect(response).to redirect_to question
      end

      context 'when the form contains invalid attributes' do
        let(:title) { 'a' * 500 }

        it 're-renders the registration form with the error summary' do
          post_create

          expect(response.body).to include 'Title is too long'
        end

        it "has an 'Unprocessable Entity' HTTP response status" do
          post_create

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
