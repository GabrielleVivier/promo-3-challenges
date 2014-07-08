require_relative "compute_name"

def ask_and_get(param)
  puts "Give me your #{param}"
  name = gets.chomp
  return name
end

def name_from_terminal
  first_name = ask_and_get("first name")
  second_name = ask_and_get("middle name")
  last_name = ask_and_get("last name")

  compute_name(first_name, second_name, last_name)
end

full_name = name_from_terminal

#TODO: use string concatenation to build a custom message embedding the computed full_name

# custom_message =

custom_message = "Hello" + " " + full_name + " " + "!"

puts custom_message
