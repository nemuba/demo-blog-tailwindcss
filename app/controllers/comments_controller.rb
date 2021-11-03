class CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.turbo_stream
        format.html { render :new }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      else
        format.turbo_stream
        format.html { render :new }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id, :user_id)
  end
end
