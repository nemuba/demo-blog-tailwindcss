# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
