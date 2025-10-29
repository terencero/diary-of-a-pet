class AppointmentsController < ApplicationController
  before_action :set_pet_profile
  before_action :set_appointment, only: %i[ edit update destroy ]

  include ItemsBySort

  def index
    @appointments = get_items_sorted_by_pet(:appointments)
  end

  def new
    @pet = PetProfile.find(params[:pet_profile_id])
    @appointment = Appointment.new
  end

  def create
    if @pet
      @pet.appointments.new(appointment_params)
      if @pet.save
        redirect_to @pet, notice: "Appointment created"
      else
        render @pet
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @appointment.destroy
    redirect_to PetProfile.find(@appointment.pet_profile_id)
  end

  private
  def set_pet_profile
    if pet_profile_path?
      @pet = PetProfile.find(params[:pet_profile_id])
    else
      @pets = PetProfile.all
    end
  end

  def appointment_params
    params.expect(appointment: [ :title, :category, :appt_start, :appt_end, :notes ])
  end

  def pet_profile_path?
    params.include? :pet_profile_id
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
