# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "router"

MEAL_CSV_FILE = File.join(__dir__, "data/meals.csv")
CUSTOMER_CSV_FILE = File.join(__dir__, "data/customers.csv")
meals_repo = MealRepository.new(MEAL_CSV_FILE)
customers_repo = CustomerRepository.new(CUSTOMER_CSV_FILE)
meals_controller = MealsController.new(meals_repo)
customers_controller = CustomersController.new(customers_repo)
router = Router.new(meals_controller, customers_controller)
router.run
