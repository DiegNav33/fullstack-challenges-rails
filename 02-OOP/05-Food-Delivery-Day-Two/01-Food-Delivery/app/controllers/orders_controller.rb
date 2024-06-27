require_relative "../models/order"
require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"

class OrdersController

  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end
  # Start manager
  def add
    meals = display_meals
    meal_index = @orders_view.ask_user_index
    meal = meals[meal_index]
    customers = display_customers
    customer_index = @orders_view.ask_user_index
    customer = customers[customer_index]
    employees = display_employees
    employee_index = @orders_view.ask_user_index
    employee = employees[employee_index]
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display_orders(undelivered_orders)
  end
  # End manager

  # Start rider
  def list_my_orders(current_user)
    list_my_undelivered_orders(current_user)
  end

  def mark_as_delivered(current_user)
    list_my_undelivered_orders(current_user)
    index = @orders_view.ask_user_index
    my_orders = @order_repository.my_undelivered_orders(current_user)
    order = my_orders[index]
    @order_repository.mark_as_delivered(order)
  end
  # End rider

  private

  def display_meals
    meals = @meal_repository.all
    @meals_view.display_meals(meals)
  end

  def display_customers
    customers = @customer_repository.all
    @customers_view.display_customers(customers)
  end

  def display_employees
    employees = @employee_repository.all_riders
    @employees_view.display(employees)
  end

  def list_my_undelivered_orders(user)
    orders = @order_repository.my_undelivered_orders(user)
    @orders_view.display_orders(orders)
  end
end
