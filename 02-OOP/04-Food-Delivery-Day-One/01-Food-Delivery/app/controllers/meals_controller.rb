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

  private

  def display_meals
    meals = @repository.all
    @view.display_meals(meals)
  end
end
