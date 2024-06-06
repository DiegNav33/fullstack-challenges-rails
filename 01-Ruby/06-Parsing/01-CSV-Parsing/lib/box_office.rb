require 'csv'

def most_successful(number, max_year, file_path)
  # TODO: return an array of most successful movies before `max_year`
  movies_list = []

  CSV.foreach(file_path, encoding: 'UTF-8') do |element|
    name = element[0]
    year = element[1].to_i
    earnings = element[2].to_i

    if year < max_year
      movies_list << { name: name, year: year, earnings: earnings }
    end
  end

  sorted_list = movies_list.sort_by { |movie| movie[:earnings] }.reverse
  sorted_list.take(number)
end

puts most_successful(5, 1940, "lib/movies.csv")
