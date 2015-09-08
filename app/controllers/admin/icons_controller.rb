class Admin::IconsController < Admin::AdminController
  def index
    @new_icon = Icon.new
    @icons = Icon.all
  end

  def create
    @new_icon = Icon.new icon_params
    if @new_icon.save
      flash[:success] = "Icon wurde hochgeladen!"
    else
      flash[:danger] = @new_icon.errors.full_messages.join "\n"
    end
    redirect_to admin_icons_path
  end

  private
  def icon_params
    params.require(:icon).permit(:icon)
  end
end
