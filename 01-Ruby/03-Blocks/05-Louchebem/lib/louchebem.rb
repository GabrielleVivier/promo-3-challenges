# Encoding: utf-8

#
def louchebemize(sentence)
  #TODO: implement your louchebem translator
  sentence.split(" ").map(&:louchebemize_word).join(' ')
end

def louchebemize_word(word)
  suffixe = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
  vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"] # %w(a e i o u y A E I O U Y)
  special_characters = [""]
  if word.length == 1
    word
  elsif vowels.include?(word[0])
    "l#{word}#{suffixe.sample}"
  else
    first_vowel_index = word.index(/[aeuiouAEIOU]/)
    "l" + word[first_vowel_index..(word.size-1)] + word[0..(first_vowel_index - 1)] + suffixe.sample
  end
end

puts louchebemize_word("charlie")