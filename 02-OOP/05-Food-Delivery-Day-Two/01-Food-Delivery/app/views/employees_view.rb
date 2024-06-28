require "io/console"

class EmployeesView

  def ask_user_username
    puts "Enter your username:"
    print "> "
    return gets.chomp
  end

  def ask_user_password
    puts "Enter your password: "
    print "> "
    password = capture_password
    puts "" # Pour aller à la ligne après la saisie du mot de passe
    password
  end

  def error_login
    puts "┌──────────────────────────────────────────┐"
    puts "│   ⚠️  Username or password incorrect      │"
    puts "└──────────────────────────────────────────┘"
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end

  def error_message
    puts "┌──────────────────────────────────────────┐"
    puts "│ ⚠️  An error occurred, please try again!  │"
    puts "└──────────────────────────────────────────┘"
  end

  private

  def capture_password
    password = ''
    while (char = STDIN.getch) != "\r" # "\r" est la touche "Enter"
      if char == "\u007F" # Si l'utilisateur appuie sur "Backspace"
        password.chop! unless password.empty?
        print "\b \b" # Supprime le dernier caractère affiché
      else
        password << char
        print "*"
      end
    end
    password
  end
end
