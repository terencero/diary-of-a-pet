class SuppliesController < ApplicationController
  before_action :set_pet_profile

  def index
    @supplies = Supply.all
    # i think this logic might be more suitable in the model
    @supplies_sorted_by_pet = @supplies.sort { |a, b| a.pet_profile_id <=> b.pet_profile_id }
    @supplies_by_pet = @supplies_sorted_by_pet.reduce(Hash.new) do |result, supply|
      pet = @pets.find(supply.pet_profile_id)
      if result[pet.name]
        result[pet.name][:supplies].push(supply)
        result
      else
        result[pet.name] = { supplies: [ supply ] }
        result
      end
    end
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

  private
    def set_pet_profile
      puts "in pet profile path"
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
end
