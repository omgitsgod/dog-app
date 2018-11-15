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

  def show
    @wishlist = Wishlist.new
    @dog = $petfinder.pet(params[:id])
  end

  def edit
    @dog = $petfinder.pet(params[:id])
    @dogs = $petfinder.find_pets('dog', '10009')
  end
end
