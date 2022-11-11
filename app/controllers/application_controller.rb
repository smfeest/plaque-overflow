# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end
end
