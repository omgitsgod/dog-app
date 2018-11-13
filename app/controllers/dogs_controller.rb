class DogsController < ApplicationController

  def index
    #@dogs = Dog.all
    @dogs = $petfinder.find_pets('dog', '10005')

  end

  def show

    @dog = $petfinder.pet(params[:id])
byebug
  end
end
