class DogsController < ApplicationController

  def index
    #@dogs = Dog.all
    if session[:user_id]
    @zip = User.find(session[:user_id]).location
  else
    @zip = '10009'
  end


    @dogs = $petfinder.find_pets('dog', @zip)
  end

  def new
    @dog = Dog.new
    @user = User.find(session[:user_id])
  end

def create
  @dog = Dog.new(dog_params)
  if @dog.save
    redirect_to settings_path
  else
    render :new
end
end

  def show
    @user = User.find(session[:user_id])
    @wishlist = Wishlist.new
    @dog = $petfinder.pet(params[:id])
  end

  def edit
    @dog = $petfinder.pet(params[:id])
    @dogs = $petfinder.find_pets('dog', '10009')
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :user_id, :breeds, :sex, :size, :age)
  end
end
