require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  return "The player's score is #{player_score} and the bank's score is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score > 21
    return "Lose, your score is higher than 21"
  elsif player_score == 21
    return "Black Jack ! Congratulations !"
  elsif player_score > bank_score
    return "Win ! Congratulations ! Your score is higher than the dealer's"
  elsif player_score < bank_score
    return "Lose ! Your score is lower than the dealer's"
  elsif player_score == bank_score
    return "Push ! Your score equals the dealer's, so you get your money back"
  end
end
