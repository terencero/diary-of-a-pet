class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.boolean :complete
      t.string :notes
      t.boolean :recurring
      t.string :label

      t.timestamps
    end
  end
end
