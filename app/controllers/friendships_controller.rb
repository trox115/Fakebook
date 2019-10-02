# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @friendship_requests = current_user.friend_requests
    @friends = current_user.friends
  end

  def create
    @friendship_request = Friendship.new(friend_id: params[:id])
    @friendship_request.user_id = current_user.id
    other = User.find_by(id: params[:id])
    if @friendship_request.save
      flash[:success] = "You send a friend request to #{other.name}"
    else
      if current_user.friend?(other)
        flash[:alert] = "You and #{other.name} are already friends"
      else
        flash[:error] = "You already sent a friend request to #{other.name}"
      end
    end
    redirect_to users_index_path
  end

  def update
    user = User.find_by(id: params[:id])
    if current_user.confirm_friend(user)
      flash[:success] = 'Now You are friends'
    else
      flash[:notice] = 'There was a problem'
    end
    redirect_to users_index_path
  end
end
