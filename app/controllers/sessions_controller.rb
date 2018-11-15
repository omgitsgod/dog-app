class SessionsController < ApplicationController
  def new

  end

  def create
  #  session[:username] = params[:username]
  #      redirect_to '/'

  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    log_in_user(@user)
    redirect_to '/'
  else
    flash[:errors] = [ "Username or password didn't match" ]
    redirect_to new_session_path
  end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
