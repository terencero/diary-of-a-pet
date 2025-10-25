class PetProfilesController < ApplicationController
  include ItemsByPet
  def index
    @pets = PetProfile.all
  end

  def show
    @pet = PetProfile.find(params[:id])

    @tasks = get_items_sorted_by_pet(:tasks)
    @supplies = get_items_sorted_by_pet(:supplies)
    @appointments = get_items_sorted_by_pet(:appointments)
  end
end
