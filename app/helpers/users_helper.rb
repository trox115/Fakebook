module UsersHelper
  def show_all_users
    @users=User.all
  end
end
