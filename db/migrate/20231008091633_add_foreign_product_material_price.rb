class AddForeignProductMaterialPrice < ActiveRecord::Migration[7.0]
  def change
    add_reference :material_prices, :products, foreign_key: true
  end
end
