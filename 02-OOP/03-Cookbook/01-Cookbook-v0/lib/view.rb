require_relative "cookbook"
require_relative "recipe"
require_relative "controller"
require_relative "marmiton"
require 'csv'

class View

  def display_recipes(recipes_tab)
    recipes_tab.each_with_index do |recipe, recipe_id|
    puts "#{recipe_id + 1} - #{recipe.name} : #{recipe.description}, #{recipe.rating}"
    end
  end

  def get_new_recipe_name
    puts "What is the name of recipe you want to add?"
    return gets.chomp
  end

  def get_new_recipe_description
    puts "What is the description of recipe you want to add?"
    return gets.chomp
  end

  def get_id_to_remove
    puts "Which recipe do you want to delete?"
    return gets.chomp.to_i
  end

  def get_ingredient_for_url
    puts "On which ingredient you want to load a research on marmiton ? "
    return gets.chomp
  end

end