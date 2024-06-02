require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

puts """Welcome to the Casino ! Let's play the Black Jack game.
The rules are simple, its all about score, you start with a score of 0 and the dealer with a random score between 16 and 21.

Every turn you will have the choice between 2 options :
  - Pick a card to get a  random score between 1 and 11. The value will be added to your remain score
  - Keep your remaining score and stop the game to see the result.

There are 5 possibilites at the end of the game :
  -'Lose' your score is higher than 21
  -'Black Jack' your score equals 21
  -'Win' your score is higher than the dealer's
  -'Lose' your score is lower the the dealer's
  -'Push' your score equals the dealer's. You get your money back

Good luck ! ;)

"""

# new_score_player = 0
# bank_score = pick_bank_score

# while true
#   puts "Pick a card ? 'y' or 'yes' to get a new card"
#   answer = gets.chomp.downcase

#   if answer == "y" || answer == "yes"
#     card = pick_player_card
#     new_score_player += card
#     puts state_of_the_game(new_score_player, bank_score)
#     if new_score_player >= 21
#       break
#     end
#   else
#     break
#   end
# end

# puts end_game_message(new_score_player, bank_score)


new_score_player = 0
bank_score = pick_bank_score
continue_game = true

while continue_game
  puts "Pour tirer une carte ecris 'y' ou 'yes'"
  answer = gets.chomp.downcase

  if %w[y yes].include?(answer)
    score = pick_player_card
    new_score_player = new_score_player + score
    puts state_of_the_game(new_score_player, bank_score)
    if new_score_player > 21
      break
    end
  else
    break
  end
end

puts end_game_message(new_score_player, bank_score)
