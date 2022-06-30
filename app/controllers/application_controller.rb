class ApplicationController < ActionController::Base
  # exige a autentificação antes acessar as rotas da company
  before_action :authenticate_company!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name description])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email name description password password_confirmation])
  end
end
