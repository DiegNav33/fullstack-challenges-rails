class MealsView

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. |🍽️ : #{meal.name} => 💲: #{meal.price}€|"
    end
  end

  def ask_user_name
    puts "Enter a meal's name"
    return gets.chomp.capitalize
  end

  def ask_user_price
    puts "Enter the meal's price"
    return gets.chomp.to_i
  end

  def ask_user_index
    puts "Pick with the Index number!"
    return gets.chomp.to_i - 1
  end
end
