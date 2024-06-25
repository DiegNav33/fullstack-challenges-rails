require_relative "../models/meal"
require_relative "../views/meals_view"

class MealsController

  def initialize(repository)
    @repository = repository
    @view = MealsView.new
  end

  def list
    display_meals
  end

  def add
    name = @view.ask_user_name
    price = @view.ask_user_price
    meal = Meal.new(name: name, price: price)
    @repository.create(meal)
  end

  def remove
    display_meals
    index = @view.ask_user_index
    @repository.destroy(index)
  end

  def update
    display_meals
    index = @view.ask_user_index
    new_name = @view.ask_user_name
    new_price = @view.ask_user_price
    @repository.edit(index, name: new_name, price: new_price)
  end

  private

  def display_meals
    meals = @repository.all
    @view.display_meals(meals)
  end
end
