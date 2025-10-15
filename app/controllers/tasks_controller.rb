class TasksController < ApplicationController
  before_action :set_pet_profile
  before_action :set_task, only: %i[ edit ]

  def index
    @tasks = Task.all
  end

  def create
    if @pet
      @pet.tasks.new(task_params)
      if @pet.save
        redirect_to @pet, notice: "Task created"
      else
        render @pet
      end
    end
  end

  def edit
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

    def task_params
      params.expect(task: [ :title, :due_date, :complete, :recurring, :label, :notes ])
    end

    def pet_profile_path?
      Rails.logger.info "what is path #{params}"
      Rails.logger.info "checking path #{params.include?(:pet_profile_id)}"
      params.include? :pet_profile_id
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
