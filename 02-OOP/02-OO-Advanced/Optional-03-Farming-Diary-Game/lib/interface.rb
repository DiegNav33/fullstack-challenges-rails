# DO NOT remove the line below, written for display purpose
require_relative "../spec/helper/board"

require_relative "rice"
require_relative "corn"
require_relative "cow"
require_relative "chicken"

# Display the state of the farm (move the line below in the loop when asked)
# Board.new.display

crops = []
animals = []

loop do
  Board.new.display
  puts "Pick an action: [corn | rice | water | cow | chicken | feed | quit]"
  action = gets.chomp.downcase
  case action
  when "corn"
    puts "Let's plant corn crops!"
    new_corn = Corn.new
    crops << new_corn
  when "rice"
    puts "Rice crops today!"
    new_rice = Rice.new
    crops << new_rice
  when "water"
    if crops.empty?
      puts "There is no planted crops to waters, please plant before !"
    else
      crops.each do |crop|
        crop.water!
      end
    end
  when "cow"
    puts "Welcome to your new cow !"
    new_cow = Cow.new
    animals << new_cow
  when "chicken"
    gender = ["female", "male"].sample
    puts "Welcome to your new chicken which is a #{gender}"
    new_chicken = Chicken.new(gender)
    animals << new_chicken
  when "feed"
    if animals.empty?
      puts "There is no animals to feed !"
    else
      animals.each do |animal|
        animal.feed!
      end
    end
  when "quit"
    puts "See you next time!"
    exit
  else
    puts "Please choose a valid action !"
  end
end
