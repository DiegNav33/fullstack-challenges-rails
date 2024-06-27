class EmployeesView

  def ask_user_username
    puts "What's your username?"
    return gets.chomp
  end

  def ask_user_password
    puts "What's your password?"
    return gets.chomp
  end

  def error_login
    puts "Error ! username or password not correct"
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end
end
