json.meta do
  json.status 200
  json.type "OK"
  json.error_code nil
  json.developer_message "Success"
  json.message "Success"
  json.timestamp Time.at(Time.now.to_i)
  json.log_id SecureRandom.uuid
end

json.response do
  json.id @product.id
  json.name @product.name
  json.description @product.description
  json.created_at @product.created_at
  json.updated_at @product.updated_at

  json.material_prices @material_prices do |material_price|
    json.id material_price.id
    json.name material_price.name
    json.currency material_price.currency
    json.price material_price.price
    json.created_at material_price.created_at
    json.updated_at material_price.updated_at
    json.quantity material_price.quantity
  end
end