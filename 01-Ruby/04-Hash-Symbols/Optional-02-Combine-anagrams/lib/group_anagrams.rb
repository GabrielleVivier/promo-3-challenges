def group_anagrams(words)
  #TODO: group anagrams
  hash = words.group_by { |word| word.downcase.split(//).sort }
  hash.values
end

# input:
p group_anagrams( ['Cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )

# =>  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]


