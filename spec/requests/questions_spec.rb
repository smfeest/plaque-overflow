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
end
