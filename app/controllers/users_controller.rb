class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user)
    redirect_to "/"
  else
    flash[:errors] = @user.errors.full_messages
    redirect_to new_user_path
  end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

  end
  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :name, :location)
  end
end
