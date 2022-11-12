# frozen_string_literal: true

class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @new_answer = Answer.new(question: @question)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params.merge(author: current_user))

    if @question.persisted?
      redirect_to @question
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
