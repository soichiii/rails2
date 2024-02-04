# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to show_profile_user_path, notice: 'アカウント情報を更新しました。'
    else
      render 'edit'
      flash.now[:notice] 
    end
  end

  def show_profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to user_account_path(current_user), notice: 'プロフィールが更新されました。'
      flash[:notice]
    else
      render 'edit_profile'
      flash.now[:notice] 
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :avatar, :description)
  end
end
