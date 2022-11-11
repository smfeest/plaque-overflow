# frozen_string_literal: true

class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end
end
