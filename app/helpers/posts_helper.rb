# frozen_string_literal: true

module PostsHelper
  def current_user_is_creator?(post)
    current_user.posts.find_by(id: post.id) ? true : false
  end

  def likes(post)
    Post.find_by(id: post.id).liked_users.count
  end
end
