require_relative "../models/customer"
require_relative "../views/customers_view"

class CustomersController

  def initialize(repository)
    @repository = repository
    @view = CustomersView.new
  end

  def list
    display_customers
  end

  def add
    name = @view.ask_user_name
    address = @view.ask_user_address
    customer = Customer.new(name: name, address: address)
    @repository.create(customer)
  end

  private

  def display_customers
    customers = @repository.all
    @view.display_customers(customers)
  end
end
