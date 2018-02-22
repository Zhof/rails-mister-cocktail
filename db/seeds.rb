# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
puts "Parsing..."

ingredients_url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_buffer = open(ingredients_url).read
ingredients_list = JSON.parse(ingredients_buffer)
ingredients = ingredients_list['drinks']

ingredients.each do |drink|
  drink[:name] = drink.delete('strIngredient1')
end

puts "Cleaning..."
Ingredient.destroy_all


puts "Creating..."
Ingredient.create!(ingredients)
Cocktail.create!(name: "Aviation")
Dose.create!(description: '6cl', ingredient_id: 1, cocktail_id: 1)
