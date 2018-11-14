class DogsController < ApplicationController

  def index
    #@dogs = Dog.all
    @zip = User.find(session[:user_id]).location
    @dogs = $petfinder.find_pets('dog', @zip)

  end

  def show

    @dog = $petfinder.pet(params[:id])

  end

  def edit
    @dog = $petfinder.pet(params[:id])
    @dogs = $petfinder.find_pets('dog', '10009')
  end
end
