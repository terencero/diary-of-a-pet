module ItemsBySort
  extend ActiveSupport::Concern

  included do
    helper_method :get_items_sorted_by_pet, :get_items_sorted_by_desc
  end

  ITEM_TYPES = {
    supplies: Supply,
    tasks: Task,
    appointments: Appointment
  }

  def get_items_sorted_by_pet(item_type)
    @items = @pet ? @pet.send(item_type.to_s) : ITEM_TYPES[item_type].all # i guess [] access only works for table columns, but not associations
    @items_sorted_by_pet = @items.sort { |a, b| a.pet_profile_id <=> b.pet_profile_id }
    @items_by_pet = @items_sorted_by_pet.reduce(Hash.new) do |result, task|
      pet = @pet || PetProfile.find(task.pet_profile_id)
      if result[pet.name]
        result[pet.name][item_type].push(task)
        result
      else
        result[pet.name] = { item_type => [ task ] }
        result
      end
    end
  end

  def get_items_sorted_by_desc(item_type)
    @items = ITEM_TYPES[item_type].order(due_date: :desc)
  end
end
