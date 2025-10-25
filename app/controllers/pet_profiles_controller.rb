class PetProfilesController < ApplicationController
  before_action :set_pet_profile, only: %i[ show edit update destroy ]

  include ItemsByPet

  def new
    @pet = PetProfile.new
  end

  def create
    @pet = PetProfile.new(pet_profile_params)
    if @pet.save
      redirect_to pet_profiles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @pets = PetProfile.all
  end

  def show
    @pet = PetProfile.find(params[:id])

    @tasks = get_items_sorted_by_pet(:tasks)
    @supplies = get_items_sorted_by_pet(:supplies)
    @appointments = get_items_sorted_by_pet(:appointments)
  end

  def edit
    @pet = PetProfile.find(params[:id])
  end

  def update
    if @pet.update(pet_profile_params)
      redirect_to pet_profiles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to pet_profiles_path
  end

  private
  def pet_profile_params
    params.expect(pet_profile: [ :animal, :name, :dob, :gender ])
  end

  def set_pet_profile
    @pet = PetProfile.find(params[:id])
  end
end
