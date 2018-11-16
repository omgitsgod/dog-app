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

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  def wishlist
    @user = User.find(session[:id])
    @dog = $petfinder.pet(params[:id])
    @user.wish_list << @dog
    redirect_to @dog
  end



  def settings
    @user = User.find(session[:user_id])
  end
  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :name, :location, :wish_list)
  end
end
