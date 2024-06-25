# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "router"

MEAL_CSV_FILE = File.join(__dir__, "data/meals.csv")
meals_repo = MealRepository.new(MEAL_CSV_FILE)
meals_controller = MealsController.new(meals_repo)
router = Router.new(meals_controller)
router.run
