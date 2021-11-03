# frozen_string_literal: true

# class HomeController
class HomeController < ApplicationController
  def index; end

  def clear_message
    respond_to do |format|
      format.turbo_stream
    end
  end
end
