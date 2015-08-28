class Admin::AdminController < ApplicationController
  before_filter :authenticate_admin
  helper_method :current_admin
  layout "admin"

  private
  def authenticate_admin
    redirect_to admin_log_in_path unless current_admin
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end
end
