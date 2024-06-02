require_relative "burger_restaurant"

puts "💬 I'd like a burger with a bigger portion of fish, plus mayo and salad please."
# TODO: to upgrade a portion to a bigger one, transform the fish to uppercase
 bigger_burger = burger("fish", "mayo", "salad") {|patty| patty}
 p bigger_burger


puts "💬 I'd like a juicy steak with barbecue sauce and cheddar please."
# TODO: to make a juicy steak, replace any vowel by the sign "~"
juicy_patty = "steak".gsub(/[aeiou]/i, "~")
juicy_burger = burger(juicy_patty.downcase, "barbecue", "cheddar")
p juicy_burger

puts "💬 I'd like a spicy chicken with ketchup and cheddar please."
# TODO: to make a spicy portion, add the sign "*" before and after the string
spicy_chicken = "*" + "chicken" + "*"
spicy_burger = burger(spicy_chicken, "ketchup", "cheddar")
p spicy_burger




















# DO NOT remove this line, written for testing purpose
@variables = local_variables.to_h { |v| [v, binding.local_variable_get(v)] }
