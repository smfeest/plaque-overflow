# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :redirect_if_already_logged_in, only: :new

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      log_in_user @user
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    return redirect_existing_user if existing_user

    throw
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def existing_user
    @existing_user ||= User.ci_find_by_email(user_params[:email])
  end

  def redirect_if_already_logged_in
    redirect_to root_path if current_user
  end

  def redirect_existing_user
    flash.alert = 'You’ve already registered with that email address. Please log in instead.'
    redirect_to log_in_path(email: existing_user.email)
  end
end
