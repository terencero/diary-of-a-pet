class CreatePetProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :pet_profiles do |t|
      t.string :animal
      t.string :name
      t.date :dob
      t.string :gender

      t.timestamps
    end
  end
end
