class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :last_name])
  end
  private
  def set_layout layout = "application"
    Proc.new {|controller| controller.request.format.json? ? false : layout}.call(self)
  end
end
