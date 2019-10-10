# frozen_string_literal: true

module UsersHelper
  def show_all_users
    @users = User.all
  end

  def friend_requested?(user)
    current_user.pending_friends.include? user
  end
end
