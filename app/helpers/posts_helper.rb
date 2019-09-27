module PostsHelper
  def post_creator(post)
    User.find_by(id: post.user_id).name
  end
end

