# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @recent_questions = Question.order_by_most_recently_posted.limit(30)
  end
end
