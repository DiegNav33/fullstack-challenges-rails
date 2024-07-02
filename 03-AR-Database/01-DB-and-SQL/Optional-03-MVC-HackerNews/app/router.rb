require_relative "controllers/posts_controller"

class Router
  def initialize
    @controller = PostsController.new
  end

  def run
    print_welcome
    loop do
      print_menu
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def route_action(action)
    space_between_action = "\n" * 10
    case action
    when 1
      @controller.index
      puts space_between_action
    when 2
      @controller.create
      puts space_between_action
    when 3
      @controller.update
      puts space_between_action
    when 4
      @controller.destroy
      puts space_between_action
    when 5
      @controller.upvote
      puts space_between_action
    when 6
      puts "See you next time!"
      puts space_between_action
      exit
    end
  end

  def actions
    [
      "List all posts",
      "Add a post",
      "Edit a post title & url",
      "Delete a post",
      "Vote for a post",
      "Exit the program"
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end

  def print_welcome
    puts "-----------------------------"
    puts "Welcome to HackerNewsCopyCat!"
    puts "-----------------------------"
  end
end
