# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end
end
