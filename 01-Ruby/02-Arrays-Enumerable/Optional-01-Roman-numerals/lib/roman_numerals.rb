def old_roman_numeral(an_integer)
  #TODO: translate integer in roman number - old-style way
  roman_numbers = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I"=>1}
  roman_string = ""
  roman_numbers.each do |key, value|
    quotient = an_integer / value
    an_integer = an_integer % value
    if quotient >= 1
      roman_string += key*quotient
    end
  end
  roman_string
end

def new_roman_numeral(an_integer)
  #TODO: translate integer in roman number - modern-style way
  #roman_numbers = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I"=> 1
  arabic_numbers = [1000, 500, 100, 50, 10, 5, 1]
  roman_numbers = ["M", "D", "C", "L", "X", "V", "I"]
  roman_string = ""
  arabic_numbers.each_with_index do |value, index|
    if (an_integer*5) / (value) == 9 && value.to_s.chars.first == "5"
    quotient = an_integer / value
      if quotient == 9
        roman_string += roman_numbers[index] + roman_numbers[index-2]
      break
      else
      roman_string += roman_numbers[index+1] + roman_numbers[index-1]
      an_integer = an_integer % (arabic_numbers[index+1])
      end
    else
      quotient = an_integer / value
      an_integer = an_integer % value
      if quotient == 4
        roman_string += roman_numbers[index] + roman_numbers[index-1]
      elsif quotient >= 1
        roman_string += roman_numbers[index]*quotient
      end

    end
  end
  roman_string
end

puts new_roman_numeral(19)
