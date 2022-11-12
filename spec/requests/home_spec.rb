# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home' do
  describe 'home#index' do
    context 'when there are questions' do
      let!(:question) { create(:question) }

      it 'renders the most recent questions' do
        get root_path

        expect(response.body).to include question.title
      end
    end

    context 'when there are no questions' do
      it 'does not render the recent questions heading' do
        get root_path

        expect(response.body).not_to include 'Recent questions'
      end
    end

    it "responds with a 'Success' HTTP response status" do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end
end
