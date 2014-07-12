def roman_to_integer(roman_string)
  #TODO: translate roman string to integer
  roman_hash = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I"=>1}
  roman_array = roman_string.split(//).reverse
  previous_value = 0
  integer = 0
  roman_array.each do |n|
    if roman_hash[n] >= previous_value
      integer += roman_hash[n]
    else
      integer -= roman_hash[n]
    end
  previous_value = roman_hash[n]
  end
  return integer
end

# testing your program
puts roman_to_integer('IV') == 4 # => true
puts roman_to_integer('XII') == 12 # => true
puts roman_to_integer('XIX') == 19 # => true
puts roman_to_integer('CLXXXVIII') == 188
puts roman_to_integer('CCCXCVIII') == 398

