# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :creator_user, only: %i[edit update destroy]
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
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = ' Your post has been deleted'
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      @post.update(post_params)
      flash[:success] = 'Your post has been updated!'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def creator_user
    @post = current_user.posts.find_by(id: params[:id])
    return if @post

    flash[:notice] = ' The post does not belongs to the current user'
    redirect_to posts_path
  end
end
