# frozen_string_literal: true

class CommetsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[id])
    comment = current_user.comments.build(comment_params)
    comment.post_id = post.id
    if comment.save()
      flash[:success] = ' You added a comment'
    else
      flash[:notice] = ' Your comment could not be added'
    end
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
