class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :null_session
  before_action :set_last_page, unless: :devise_controller?
  before_action :ensure_profile_complete

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :not_found

  def not_found
    if current_user
      flash[:alert] = "You are not authorized to perform this action"
      redirect_path = root_path
    else
      flash[:alert] = "Please log in"
      redirect_path = new_user_session_path
    end
    redirect_to(redirect_path)
    # redirect_to(request.referer || redirect_path)
    # raise ActionController::RoutingError, 'Not Found'
  end

  def user_not_authorized
    if current_user
      flash[:alert] = "You are not authorized to perform this action"
      redirect_path = root_path
    else
      flash[:alert] = "Please log in"
      redirect_path = new_user_session_path
    end
    redirect_to(redirect_path)
  end

  def set_last_page
    cookies[:last_page] = { value: request.path, domain: request.domain, path: '/' }
  end

  def current_attempt
    current_user&.current_attempt
  end

  def ensure_profile_complete
    if current_user && !devise_controller? && !current_user&.profile&.complete
      unless controller_name == 'profiles'
        flash[:alert] = "Please finish setting up your profile."
        redirect_to '/profile'
      end
    end
  end

  def redirect_to_user_root
    redirect_to user_root_path if current_user
  end

  def user_root_path
    if current_user&.purchased
      '/videos'
    elsif !current_user&.profile&.complete
      flash[:alert] = "Please finish setting up your profile."
      '/profile' unless controller_name == 'profiles' && action_name == 'edit'
    elsif current_user&.profile&.complete
      flash[:alert] = "Please finish checking out."
      '/checkout' unless controller_name == 'home' && action_name == 'checkout'
    else
      root_path
    end
  end

end
