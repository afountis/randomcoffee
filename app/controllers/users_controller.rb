class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      department_id: params[:user][:department_id]
    )

    if @user.save
      redirect_to registered_users_path
    else
      render :new
    end
  end

  def registered
  end
end
