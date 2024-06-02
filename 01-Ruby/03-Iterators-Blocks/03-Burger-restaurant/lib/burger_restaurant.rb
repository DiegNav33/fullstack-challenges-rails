def burger(patty, sauce, topping)
  # TODO: code the `burger` method
  my_burger = [patty, sauce, topping]
  my_burger.unshift("bread")
  my_burger << "bread"
  patty.upcase! if block_given?
  yield(patty.upcase) if block_given?
  return my_burger
end
