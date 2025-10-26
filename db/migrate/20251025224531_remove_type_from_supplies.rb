class RemoveTypeFromSupplies < ActiveRecord::Migration[8.0]
  def change
    remove_column :supplies, :type, :string
  end
end
