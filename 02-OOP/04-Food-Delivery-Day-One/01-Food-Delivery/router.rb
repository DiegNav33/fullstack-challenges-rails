# TODO: implement the router of your app.

class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
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
    case action
    when 1
      @meals_controller.list
    when 2
      @meals_controller.add
    when 3
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
    puts "3 - Stop and exit the program"
    print "> "
  end
end
