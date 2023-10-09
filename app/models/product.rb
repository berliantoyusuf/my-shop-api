class Product < ApplicationRecord
  has_many :material_prices
  accepts_nested_attributes_for :material_prices
end
