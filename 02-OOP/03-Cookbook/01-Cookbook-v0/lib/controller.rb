require_relative "view"
require_relative "recipe"
require_relative "cookbook"
require_relative "marmiton"

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_recipes(@cookbook.recipes)
  end

  def create
    name = @view.get_new_recipe_name
    description = @view.get_new_recipe_description
    attribute = { name: name, description: description }
    @cookbook.add_recipe(Recipe.new(attribute))
  end

  def destroy
    recipe_id_to_destroy = @view.get_id_to_remove - 1
    @cookbook.remove_recipe(recipe_id_to_destroy)
  end

  def create_marmiton_recipes
    ingredient = @view.get_ingredient_for_url
    marmiton_recipes = Marmiton.new(ingredient).import_recipes_from_marmiton
    @cookbook.add_marmiton_recipes(marmiton_recipes)
  end

end