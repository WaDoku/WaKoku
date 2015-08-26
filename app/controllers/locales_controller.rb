class LocalesController < ApplicationController
  def change_locale
    cookies[:locale] = params[:locale]
    redirect_to root_path
  end
end
