class FriendshipsController < ApplicationController
  def index
    @friendship_requests = current_user.friend_requests
    @friendships = current_user.friends
  end

  def create
    @friendship_request = Friendship.new(friendship_params) 
    @friendship_request.user_id = current_user.id
    if friendship_request.save
      flash[:success]="new request sent"
    else
      flash[:notice]="Cant send request"
    end
    redirect_to users_index_path
  end
  private
  
  def friendship_params
    params.require(:friendship_request).permit(:friend_id)
  end
end

