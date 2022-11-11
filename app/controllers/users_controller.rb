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
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def redirect_if_already_logged_in
    redirect_to root_path if current_user
  end
end
