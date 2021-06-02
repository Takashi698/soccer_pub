class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :image_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :image_cache])
  end
end
