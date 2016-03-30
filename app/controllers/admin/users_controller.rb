class Admin::UsersController < AdminController
  def index
    @user_list = User.all.order(first_name: :asc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mailbox, :department_id)
  end
end
