# TODO: implement the router of your app.

class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome !"
    puts "           --           "
    while @running
      display_tasks
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  def route_action(action)
    space_between_action = "\n" * 10

    case action
    when 1
      @meals_controller.list
      puts space_between_action
    when 2
      @meals_controller.add
      puts space_between_action
    when 3
      @customers_controller.list
      puts space_between_action
    when 4
      @customers_controller.add
      puts space_between_action
    when 5
      exit
    else
      puts "Choose a correct action"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all the meals"
    puts "2 - Add a new meal"
    puts "3 - list all the customers"
    puts "4 - Add a new customer"
    puts "5 - Stop and exit the program"
    print "> "
  end
end
