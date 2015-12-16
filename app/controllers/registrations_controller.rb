class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    "/register/edit"
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :first_name, :middle_name, :last_name, :role_id, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:email, :first_name, :middle_name, :last_name, :role_id, :password, :password_confirmation, :current_password)
  end

end
