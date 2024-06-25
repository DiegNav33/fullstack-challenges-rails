# TODO: implement the router of your app.

class Router

  def initialize(meals_controller, customers_controller, sessionsController)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessionsController = sessionsController
    @running = true
    @current_user = nil
  end

  def run
    space_between_action = "\n" * 5
    puts "Welcome !"
    puts "           --           "
    while @running
      @current_user = @sessionsController.login
      puts space_between_action
      while @current_user
        if @current_user.manager?
          managers_tasks
          action = gets.chomp.to_i
          route_action_managers(action)
        else
          riders_tasks
          action = gets.chomp.to_i
          route_action_riders(action)
        end
      end
    end
  end

  def route_action_managers(action)
    space_between_action = "\n" * 10
    case action
    when 1
      @meals_controller.list
      puts space_between_action
    when 2
      @meals_controller.add
      puts space_between_action
    when 3
      @meals_controller.remove
      puts space_between_action
    when 4
      @meals_controller.update
      puts space_between_action
    when 5
      @customers_controller.list
      puts space_between_action
    when 6
      @customers_controller.add
      puts space_between_action
    when 7
      @customers_controller.remove
      puts space_between_action
    when 8
      @customers_controller.update
      puts space_between_action
    when 9
      puts "TODO"
      puts space_between_action
    when 10
      puts "TODO"
      puts space_between_action
    when 11
      logout!
      puts "See you next time!"
      puts space_between_action
    when 12
      stop!
      puts "See you next time! End of the program"
      puts space_between_action
    else
      puts "Choose a correct action"
    end
  end

  def route_action_riders(action)
    space_between_action = "\n" * 10
    case action
    when 1
      puts "TODO"
      puts space_between_action
    when 2
      puts "TODO"
      puts space_between_action
    when 3
      logout!
      puts "See you next time!"
      puts space_between_action
    when 4
      stop!
      puts "See you next time! End of the program"
      puts space_between_action
    else
      puts "Choose a correct action"
    end
  end

  def managers_tasks
    puts "------- MANAGER BOARD -------"
    puts "-----------------------------"
    puts ""
    puts "WELCOME #{@current_user.username.upcase}: "
    puts ""
    puts "1 - List all the meals"
    puts "2 - Add a new meal"
    puts "3 - Remove a meal"
    puts "4 - Update a meal"
    puts "5 - list all the customers"
    puts "6 - Add a new customer"
    puts "7 - Remove a customer"
    puts "8 - Update a customer"
    puts "9 - Add a new order"
    puts "10 - List all the non delivered orders"
    puts "11 - Logout"
    puts "12 - Stop and exit the program"
    puts ""
    puts "-----------------------------"
    puts "------- MANAGER BOARD -------"
  end

  def riders_tasks
    puts "------- RIDER BOARD -------"
    puts "---------------------------"
    puts ""
    puts "WELCOME #{@current_user.username.upcase}: "
    puts ""
    puts "1 - Mark non delivered orders"
    puts "2 - List all the non delivered orders"
    puts "3 - Logout"
    puts "4 - Stop and exit the program"
    puts ""
    puts "---------------------------"
    puts "------- RIDER BOARD -------"
  end

  def logout!
    @current_user =nil
  end

  def stop!
    logout!
    @running = false
  end
end
