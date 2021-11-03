module PostsHelper
  def liked?(post)
    post.likes.where(user_id: current_user.id).present?
  end
end
