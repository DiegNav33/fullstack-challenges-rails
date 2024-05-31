require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "Ecris un message a ton coach"
student_message = gets.chomp
puts "#{coach_answer_enhanced(student_message)}"

while student_message != "I am going to work right now!"
  puts "Continue de parler avec ton coach, ce n'est pas suffisant !"
  student_message = gets.chomp
  puts coach_answer_enhanced(student_message)
end
