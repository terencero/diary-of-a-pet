class AddTypeToSupplies < ActiveRecord::Migration[8.0]
  def change
    add_column :supplies, :type, :string
  end
end
