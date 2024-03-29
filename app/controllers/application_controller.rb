class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_locale
  add_flash_types :danger, :info, :warning, :success

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : { lang: I18n.locale }
  end
  
  private

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end