class ChangeReferenceProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :material_prices, :products_id
    add_reference :material_prices, :product, foreign_key: true
  end
end
