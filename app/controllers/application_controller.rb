class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def after_sign_in_path_for(resource)
    new_profile_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_host, :first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:is_host, :first_name])
  end
end
