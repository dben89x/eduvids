class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_last_page, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :not_found

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  def user_not_authorized
    if current_user
      flash[:alert] = "You are not authorized to perform this action"
      redirect_path = root_path
    else
      flash[:alert] = "Please log in"
      redirect_path = new_user_session_path
    end
    redirect_to(request.referer || redirect_path)
  end

  def set_last_page
    cookies[:last_page] = { value: request.path, domain: request.domain, path: '/' }
  end

end
