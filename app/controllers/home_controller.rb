# frozen_string_literal: true

# class HomeController
class HomeController < ApplicationController
  def index; end

  def search
    @posts = []
    @count = 0

    if params[:q].present?
      @pagy, @posts = pagy(Post.search(params[:q]), page: 1)
      @count = @posts.count
    end

    respond_to do |format|
      format.turbo_stream
    end
  end
end
