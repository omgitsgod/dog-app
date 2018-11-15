class SheltersController < ApplicationController
def index
if session[:user_id]
@zip = User.find(session[:user_id]).location
else
@zip = '10009'
end
@shelters = $petfinder.find_shelters(@zip)
end

def show
@shelter = $petfinder.shelter(params[:id])
@shelter_pets = $petfinder.shelter_pets(@shelter.id)
end
end
