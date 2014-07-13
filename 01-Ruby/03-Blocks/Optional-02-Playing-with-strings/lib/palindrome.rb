def palindrome?(a_string)
  #TODO: check if a_string is a palindrome
  array = a_string.downcase.split(//)
  array = array.select { |x| /[[:alpha:]]/.match(x) }
  array == array.reverse
end


# Testing palindrome? function
puts "#{palindrome?("A man, a plan, a canal -- Panama")}" #=> true
puts "#{palindrome?("Madam, I'm Adam!")}" # => true
puts "#{palindrome?("Abracadabra")}" # => false
puts "#{palindrome?("Esope reste ici et se repose")}"
puts "#{palindrome?("La mariee ira mal")}"