# Encoding: utf-8

#

def louchebemize_word(word)
  suffixe = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
  vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"] # %w(a e i o u y A E I O U Y)
  if word.length == 1
    word
  elsif vowels.include?(word[0])
    "l#{word}#{suffixe.sample}"
  else
    first_vowel_index = word.index(/[aeuiouAEIOU]/)
    "l" + word[first_vowel_index..(word.size-1)] + word[0..(first_vowel_index - 1)] + suffixe.sample
  end
end

def louchebemize_word_and_punct(word)
  if word.index(/[[:punct:]]/).nil?
    louchebemize_word(word)
  else
    punct_index = word.index(/[[:punct:]]/)
    louchebemize_word(word[0..(punct_index-1)]) + word[punct_index..(word.size-1)]
  end
end

def louchebemize(sentence)
  #TODO: implement your louchebem translator
  translated_words = sentence.split(" ").map do |word|
    louchebemize_word_and_punct(word)
  end
  translated_words.join(" ")
end
