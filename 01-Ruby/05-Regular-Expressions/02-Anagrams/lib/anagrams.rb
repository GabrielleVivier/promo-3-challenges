def anagrams?(a_string, another_string)
  #TODO: implement the obvious method to test if two words are anagrams
  a_string.downcase.scan(/\w/).sort == another_string.downcase.scan(/\w/).sort
end

def anagrams_on_steroids?(a_string, another_string)
  #TODO: implement the improved method
  a_string_hash = {}
  another_string_hash = {}
  a_string.downcase.scan(/\w/).each do |x|
    if a_string_hash.has_key?(x)
      a_string_hash[x] += 1
    else
      a_string_hash[x] = 1
    end
  end
  another_string.downcase.scan(/\w/).each do |x|
    if another_string_hash.has_key?(x)
      another_string_hash[x] += 1
    else
      another_string_hash[x] = 1
    end
  end
  a_string_hash.all? { |key, value| a_string_hash[key] == another_string_hash[key] }
end
