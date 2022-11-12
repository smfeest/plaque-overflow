# frozen_string_literal: true

class AnswersController < ApplicationController
  def create
    question.answers.create!(answer_params.merge(author: current_user))

    redirect_to question
  end

  private

  def question
    @question ||= Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
