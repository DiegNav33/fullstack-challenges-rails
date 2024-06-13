class Restaurant
  # TODO: add relevant accessors if necessary

  attr_accessor :city, :name, :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0.0  # Initialisation de la moyenne des notes à 0.0
    @total_ratings = 0     # Compteur pour le nombre total de notes
  end

  # TODO: implement .filter_by_city and #rate methods
  def rate(new_rate)
    @average_rating = ((@average_rating * @total_ratings) + new_rate) / (@total_ratings + 1.0)
    @total_ratings += 1
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select do |restaurant|
      restaurant.city == city
    end
  end
end
