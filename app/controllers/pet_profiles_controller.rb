class PetProfilesController < ApplicationController
  include ItemsByPet
  def index
    @pets = PetProfile.all
  end

  def show
    @pet = PetProfile.find(params[:id])

    @tasks = get_items_sorted_by_pet(:tasks)
    @supplies = get_items_sorted_by_pet(:supplies)
  end
end
