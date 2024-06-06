require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters

  alphabet = ('A'..'Z').to_a

  grid = Array.new(grid_size) { alphabet.sample }

  grid
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  # Vérifier si le mot (attempt) est correct en anglais ou pas grace a l api
  url_api = "https://dictionary.lewagon.com/#{attempt}"
  word_check = URI.open(url_api).read
  word = JSON.parse(word_check)
  is_english = word["found"]

  # Vérifier que toutes les lettres de ton mot (attempt) apparaissent dans la grille (grid)

  # Iterer sur le mot (attempt)(.split)
      # Verifier si la lettre est présent dans grid
  is_in_grid = nil
  attempt.split("").each do |letter|
    if grid.include?(letter)
      is_in_grid = true
      grid.delete_at(grid.index(letter)|| 0)
    else
      is_in_grid = false
      break
    end
  end

  time = end_time - start_time
  message = ""
  score = nil

  if is_in_grid && is_english
    score = attempt.length
    message = "Well done !"
  else
    score = 0
    message = "The letters in your word are not in the grid, try again !"
  end

  output = { time: time, score: score, message: message }
  output
end
