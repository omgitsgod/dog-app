class ApplicationController < ActionController::Base
  $petfinder = Petfinder::Client.new('e05e0ebca38324e9ff774a7cddb57328', 'ab06379ed92612e2cf7d51faa1dbc43c')

  before_action :set_ups

 private

  def set_ups
    @logged_in = logged_in?

    if logged_in?
      @user = User.find(logged_in_user_id)
    end
    @errors = flash[:errors]
  end

  def log_in_user(user)
    session[:user_id] = user.id
    session[:location] = user.location
  end

  def log_out
    session[:user_id] = nil
  end

  def logged_in_user_id
    session[:user_id]
  end

  def logged_in?
    !!logged_in_user_id
  end

  def authorized?(user_id)
    logged_in_user_id == user_id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if !current_user
      redirect_to new_user_path, notice: "You must be signed in to do that!"
    end
  end

  helper_method :current_user, :authenticate_user
end
