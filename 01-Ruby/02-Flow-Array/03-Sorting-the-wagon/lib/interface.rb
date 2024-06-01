require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/core-3.1.2/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/core-3.1.2/String.html#method-i-chomp

students = []
puts "Ecris un prénom d'étudiant à ajouter au Wagon !"
student_name = gets.chomp
students.push(student_name) unless student_name.empty?

while student_name != ""
  puts "Ecris un prénom d'étudiant à ajouter au Wagon, si tu as finis appui entrer sans rien mettre !"
  student_name = gets.chomp
  students.push(student_name) unless student_name.empty?
end

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list

if student_name == ""
  if students.length == 1
    puts "Congratulations! Your Wagon has #{students.length} student :"
  elsif students.empty?
    puts "Sorry your Wagon still doesnt have any students !"
    exit
  else
    puts "Congratulations! Your Wagon has #{students.length} students :"
  end
  formated_array = wagon_sort(students)
  if formated_array.length <= 2
    puts formated_array.join(" and ")
  else
    puts formated_array[0..-2].join(", ") + " and " + formated_array[-1]
  end
end
