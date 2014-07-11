def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
calories_tab = {
  "Cheese Burger" => 290,
  "Big Mac" => 300,
  "Mc Bacon" => 400,
  "Royal Cheese" => 130,
  "French fries" => 130,
  "Potatoes" => 130,
  "Coca" => 160,
  "Sprite" => 170
}
calories_tab[burger] + calories_tab[side] + calories_tab[beverage]
end

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
calories_table = {
  "Cheese Burger" => 290,
  "Big Mac" => 300,
  "Mc Bacon" => 400,
  "Royal Cheese" => 130,
  "French fries" => 130,
  "Potatoes" => 130,
  "Coca" => 160,
  "Sprite" => 170,
  "Happy Meal" => poor_calories_counter("Cheese Burger", "French fries", "Coca"),
  "Best Of Big Mac" => poor_calories_counter("Big Mac", "French fries", "Coca"),
  "Best Of Royal Cheese" => poor_calories_counter("Royal Cheese", "Potatoes", "Sprite"),
}
command_calories = 0
orders.each { |n| command_calories = command_calories + calories_table[n] }
return command_calories
end
