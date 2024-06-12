require_relative "student"

students = [
  Student.new("Jeanne", 8, 15, 4),
  Student.new("Melissa", 4, 15, 3),
  Student.new("Diego", 10, 3, 9)
]


# from the richest to the poorest
sorted_students = students.sort.reverse

sorted_students.each { |student| puts "#{student.name}: #{student.wealth}€" }
