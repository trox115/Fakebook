# frozen_string_literal: true

module PostsHelper
  def post_creator(post)
    u = User.find_by(id: post.user_id)
    u.name
  end
  
  def current_user_is_creator?(post)
    current_user.posts.find_by(id: post.id) ? true : false
      
  end
end
