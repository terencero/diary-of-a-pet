class TasksController < ApplicationController
  before_action :set_pet_profile
  before_action :set_task, only: %i[ edit update destroy ]

  def index
    if pet_profile_path?
      @tasks = @pet.tasks
    else
      @tasks = Task.all
    end
    # i think this logic might be more suitable in the model or in a controller concern
    @tasks_sorted_by_pet = @tasks.sort { |a, b| a.pet_profile_id <=> b.pet_profile_id }
    @tasks_by_pet = @tasks_sorted_by_pet.reduce(Hash.new) do |result, task|
      if pet_profile_path? # TODO: duplicating this conditional is not ideal
        pet = @pet
      else
        pet = @pets.find(task.pet_profile_id)
      end
      if result[pet.name]
        result[pet.name][:tasks].push(task)
        result
      else
        result[pet.name] = { tasks: [ task ] }
        result
      end
    end
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

  def update
    if @task.update(task_params)
      @pet = PetProfile.find(@task.pet_profile_id)
      redirect_to @pet
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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
