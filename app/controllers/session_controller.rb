# frozen_string_literal: true

# class SessionController
class SessionController < ApplicationController
  # GET /login
  def index
    @user = User.new
  end

  # POST /login
  def create
    @user = User.find_by(email: session_params[:email])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in'
    else
      redirect_to login_path, notice: 'Invalid email or password'
    end
  end

  # DELETE /logout
  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logged out'
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
