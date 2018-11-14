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
    flash[:errors] = [ "NOPE" ]
    redirect_to new_session_path
  end
  end
end
