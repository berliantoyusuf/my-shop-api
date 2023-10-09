class ChangeQuantityColumnMaterialPrice < ActiveRecord::Migration[7.0]
  def change
    remove_column :material_prices, :quantity
    add_column :material_prices, :quantity, :float
  end
end
