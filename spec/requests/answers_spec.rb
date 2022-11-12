# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers' do
  describe 'answer#create' do
    let(:question) { create(:question) }
    let(:answer_body) do
      'Blue light is scattered more than the other colors because it travels as shorter, smaller waves.'
    end

    let(:post_create) { post question_answers_path(question), params: { answer: { body: answer_body } } }

    context 'when the user is logged in' do
      include_context 'with a logged in user'

      it 'sets the current user as the author' do
        post_create

        answer = question.answers.last

        expect(answer.author).to eq current_user
      end

      it 'redirects to the question' do
        post_create

        expect(response).to redirect_to question
      end
    end
  end
end
