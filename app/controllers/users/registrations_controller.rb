# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    @user = current_user
    
  end

  def update
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to root_path, notice: 'アカウント情報を更新しました。'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
