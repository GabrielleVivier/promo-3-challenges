def group_anagrams(words)
  #TODO: group anagrams
  hash = words.group_by { |word| word.split(//).sort }
  hash.values
end

# input:
p group_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )

# =>  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]


