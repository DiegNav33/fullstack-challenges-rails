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

  def remove
    display_customers
    index = @view.ask_user_index
    @repository.destroy(index)
  end

  def update
    display_customers
    index = @view.ask_user_index
    new_name = @view.ask_user_name
    new_address = @view.ask_user_address
    @repository.edit(index, name: new_name, address: new_address)
  end

  private

  def display_customers
    customers = @repository.all
    @view.display_customers(customers)
  end
end
