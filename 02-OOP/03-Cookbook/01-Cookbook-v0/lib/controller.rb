require_relative "view"
require_relative "recipe"
require_relative "cookbook"

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

end