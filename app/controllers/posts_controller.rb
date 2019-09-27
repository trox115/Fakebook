class PostsController < ApplicationController
  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.build(post_params)
    if @post.save
     flash[:success]= 'Your post has been created'
     redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @post=Post.all
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end


