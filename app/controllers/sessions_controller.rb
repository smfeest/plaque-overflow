# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_if_already_logged_in, only: :new

  def new; end

  def create
    user = User.ci_find_by_email(params[:email])

    if user&.authenticate(params[:password])
      log_in_user(user)
      redirect_to root_path
    else
      flash.now.alert = 'The email address or password you entered is incorrect'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def redirect_if_already_logged_in
    redirect_to root_path if current_user
  end
end
