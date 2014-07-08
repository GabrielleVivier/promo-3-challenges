require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.

def user_interface
  user_input = 0
  until user_input == "I am going to work right now SIR !"
    puts "What you do want to say to your coach ?"
    user_input = gets.chomp
    puts coach_answer(user_input)
  end
end

user_interface

