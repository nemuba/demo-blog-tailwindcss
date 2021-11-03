# frozen_string_literal: true

# class RegistrationController
class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('register.message')
    else
      redirect_to new_registration_url, alert: t('register.error')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
