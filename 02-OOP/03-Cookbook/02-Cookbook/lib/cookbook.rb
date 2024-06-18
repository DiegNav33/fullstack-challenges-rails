# TODO: Implement the Cookbook class that will be our repository

class Cookbook

  def initialize
    @recipes = []
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
  end
end
