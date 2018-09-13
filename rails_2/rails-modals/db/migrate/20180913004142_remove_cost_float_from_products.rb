class RemoveCostFloatFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :cost_float, :string
  end
end
