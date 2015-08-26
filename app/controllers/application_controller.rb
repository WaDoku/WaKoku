class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    cookies[:locale] = params[:locale] || cookies[:locale] || I18n.default_locale
    I18n.locale = cookies[:locale]
  end

end
