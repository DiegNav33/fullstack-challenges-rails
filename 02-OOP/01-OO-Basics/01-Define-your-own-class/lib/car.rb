class Car
  def initialize(brand, model, motor_type, km=30)
    @brand = brand
    @model = model
    @motor_type = motor_type
    @km = km
  end

  def start
    puts "Wroum the #{@brand} #{@model} has been turned on, its mileage is #{@km}km"
  end
end
