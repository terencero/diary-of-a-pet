class CreateSupplies < ActiveRecord::Migration[8.0]
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :brand
      t.integer :inventory_count

      t.timestamps
    end
  end
end
