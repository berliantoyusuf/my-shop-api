class CreateMaterialPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :material_prices do |t|
      t.string :name
      t.string :quantity
      t.string :currency
      t.decimal :price

      t.timestamps
    end
  end
end
