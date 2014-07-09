require_relative 'black_jack'

def play_game
  #TODO: make the user play from terminal in a while loop that will stop when the user will not be asking for  a new card
  #Else the game stops and the outcome message is printed
  bank = 0
  score = 0
  bank = bank_score
  while asking_for_card?(score)
    card_value = pick_card
    score = score + card_value
    puts state_of_the_game(score, bank)
  end
  outcome = game_outcome(bank, score)
  puts build_message_for(outcome)
end

def state_of_the_game(score, bank)
  # TODO: Returns custom message with player's score and bank's score
  "Your score is #{score}, bank is #{bank}!"
end

def asking_for_card?(score)
  # TODO: Ask for a card only if the score is less or equal to 21, then returns true or false according to the user's choice
  if score <= 21
    puts "Card ? (type 'Y' or 'yes' for a new card)"
    user_choice = gets.chomp
    user_choice == "Y" || user_choice == "yes"
  end
end

def build_message_for(outcome)
  #TODO: return specific message depending on the game outcome (= bank's score and user's score)
  if outcome[1] > 21
    return "You are over 21... you loose."
  elsif outcome[1] == 21
    return "Black Jack!"
  elsif outcome[1] > outcome[0]
    return "You beat the bank! You win."
  elsif outcome[1] < outcome[0]
    return "Bank beats you! You loose."
  else
    return "Par!"
  end
end
