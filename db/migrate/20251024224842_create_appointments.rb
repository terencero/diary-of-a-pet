class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.string :category
      t.datetime :appt_start
      t.datetime :appt_end
      t.string :title
      t.string :notes
      t.belongs_to :pet_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
