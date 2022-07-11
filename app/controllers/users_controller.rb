class UsersController < ApplicationController

  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def update_profile

    if current_user.update(user_profile_params)
      redirect_to '/users/profile', notice: "「#{current_user.name}」のプロフィールを更新しました"
    else
      @user = User.new(user_profile_params)
      render '/users/profile'
    end
  end

  private
  def user_profile_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
