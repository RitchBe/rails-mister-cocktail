# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "vodka")
# Ingredient.create(name: "gin")
# Ingredient.create(name: "rum")
# Ingredient.create(name: "tequila")
# Ingredient.create(name: "brandy")
# Ingredient.create(name: "triple sec")
# Ingredient.create(name: "coffee liqueur")
# Ingredient.create(name: "dry vermouth")
# Ingredient.create(name: "campari")
# Ingredient.create(name: "orange bitters")
# Ingredient.create(name: "sugar syrup")
# Ingredient.create(name: "grenadine")
# Ingredient.create(name: "oranges")
# Ingredient.create(name: "juice")
# Ingredient.create(name: "salt")
# Ingredient.create(name: "peper")
# Ingredient.create(name: "sugar")
# Ingredient.create(name: "soda water")
# Ingredient.create(name: "cola")
# Ingredient.create(name: "cherries")
# Ingredient.create(name: "olives")
# Ingredient.create(name: "bitter")
require "open-uri"
require "json"
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

json = open(url).read

parse = JSON.parse(json)

i = 0

while parse['drinks'][i] != nil
  Ingredient.create(name: parse['drinks'][i].values.join)
  i += 1
end
# parse.each_with_index do |ingredient, i|
#   p parse['drinks'][i]
# end