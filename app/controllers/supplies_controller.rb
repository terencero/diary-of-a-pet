class SuppliesController < ApplicationController
  before_action :set_pet_profile
  before_action :set_supply, only: %i[ edit update destroy ]

  include ItemsByPet

  def index
    @supplies = get_items_sorted_by_pet(:supplies)
  end

  def create
    puts "params : #{supply_params}"
      puts "pet : #{@pet}"
      @pet.supplies.new(supply_params)

    if @pet.save
      redirect_to @pet, notice: "Supply added successfully"
    else
      render @pet
    end
  end

  def edit
  end

  def update
    if @supply.update(supply_params)
      redirect_to PetProfile.find(@supply.pet_profile_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supply.destroy
    redirect_to PetProfile.find(@supply.pet_profile_id)
  end

  private
  def set_pet_profile
    if pet_profile_path?
      @pet = PetProfile.find(params[:pet_profile_id])
    else
      @pets = PetProfile.all
    end
  end

  def supply_params
    params.expect(supply: [ :name, :brand, :inventory_count, :type ])
  end

  def pet_profile_path?
    Rails.logger.info "what is path #{params}"
    Rails.logger.info "checking path #{params.include?(:pet_profile_id)}"
    params.include? :pet_profile_id
  end

  def set_supply
    @supply = Supply.find(params[:id])
  end
end
