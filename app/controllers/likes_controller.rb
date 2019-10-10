# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @like = Like.create(post_id: params[:post_id])
    @like.user_id = current_user.id
    flash[:success] = if @like.save
                        ' You liked This post!'
                      else
                        ' You already like this post'
                      end
    redirect_to posts_path
  end
end
