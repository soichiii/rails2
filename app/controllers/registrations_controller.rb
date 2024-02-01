# app/controllers/registrations_controller.rb

class RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]
  
    def edit_account
      render 'devise/registrations/edit_account'
    end
  
    protected
  
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
    end
  end
  