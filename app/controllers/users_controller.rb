# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all_except(current_user).paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = current_user
  end
end
