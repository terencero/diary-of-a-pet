class PetProfilesController < ApplicationController
  def index
    @pets = PetProfile.all
  end

  def show
    @pet = PetProfile.find(params[:id])
  end
end
