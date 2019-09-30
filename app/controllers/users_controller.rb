class UsersController < ApplicationController
  def index
    @users= User.all_except(current_user).paginate(page: params[:page], per_page: 1)
  end
end
