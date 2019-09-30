# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Your post has been created'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all.ordered
  end

  def destroy
    @post.destroy
    flash[:success] = ' Your post has been deleted'
    reditect_to posts_path
  end

  

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def creator_user
    @post = current_user.posts.find_by(id: params[:id])
  end
end
