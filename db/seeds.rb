# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.destroy_all

for a in 1..676 do
  new_product = Product.new
  new_product.title = Faker::Commerce.unique.product_name
  new_product.price = Faker::Commerce.price(range: 0..10.0)
  new_product.stock_quantity = Faker::Number.between(from: 10, to: 200)
  new_product.save
end

p "Created #{Product.count} products."
