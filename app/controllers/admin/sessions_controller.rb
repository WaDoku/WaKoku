class Admin::SessionsController < Admin::AdminController
  skip_before_filter :authenticate_admin, only: :new
  def new
  end
  def create
    admin = Admin.authenticate(params[:email], params[:password])
    if admin
      session[:admin_id] = admin.id
      flash[:success] = "Logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:success] = "Logged out!"
    redirect_to root_path
  end
end
