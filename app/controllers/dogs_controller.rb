class DogsController < ApplicationController

  def index
    #@dogs = Dog.all
    @zip = '10009'
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
