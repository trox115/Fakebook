# frozen_string_literal: true

module PostsHelper
  def post_creator(post)
    u = User.find_by(id: post.user_id)
    u.name
  end
end
