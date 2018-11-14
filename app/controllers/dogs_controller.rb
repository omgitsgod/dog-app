class DogsController < ApplicationController

  def index
    #@dogs = Dog.all
    @zip = User.find(session[:user_id]).location || '10009'
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
