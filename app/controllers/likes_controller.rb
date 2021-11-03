class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.build(user_id: current_user.id)

    respond_to do |format|
      if @like.save
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { redirect_to @post }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = @post.likes.where(user_id: params[:id]).first

    respond_to do |format|
      if @like.destroy
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Like was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @post }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
