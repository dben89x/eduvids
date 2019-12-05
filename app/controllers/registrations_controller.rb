class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :current_password])
  end

  def after_sign_up_path_for(resource)
    if resource.is_artist
      path_maker('/artists/signup/logo')
    else
      if cookies[:last_page].present?
        go_to_place = cookies[:last_page]
        cookies.delete(:last_page)
        go_to_place
      else
        root_path
      end
    end
  end
end
