class Users::RegistrationsController < Devise::RegistrationsController
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    
    # Let Devise handle the update
    if resource.update(account_update_params)
      flash[:notice] = "Profile updated successfully."
      bypass_sign_in(resource, scope: resource_name)
      redirect_to edit_user_registration_path
    else
      clean_up_passwords resource
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :profile_photo)
  end
end
