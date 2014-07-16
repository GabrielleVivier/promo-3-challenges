def most_common_words(file_name, stop_words_file_name, number_of_word)
  #TODO: return hash of occurences of number_of_word most frequent words
  word_frequency = {}
  file_array = []
  stop_words_array = []

  File.open(stop_words_file_name).each_line do |line|
    stop_words_array << line.downcase.chomp
  end


  File.open(file_name).each_line do |line|
    file_array << line.downcase.chomp.scan(/\b\w+\b/)
  end

  file_array.flatten!

  file_array = file_array.delete_if { |word| stop_words_array.include?(word) }

  file_array.each do |word|
    word_frequency[word] = word_frequency.has_key?(word) ? word_frequency[word] + 1 :  1
  end

  Hash[word_frequency.sort_by { |key, value| - value }.first(number_of_word)]

end

source_filepath = File.dirname(__FILE__) + "/source-text.txt"
stop_words_filepath = File.dirname(__FILE__) + "/stop_words.txt"

p most_common_words(source_filepath, stop_words_filepath, 6)


  #stop_words_array.each do |value|
    #if file_array.include?(value)
    #file_array = file_array.delete(value)
    #end
  #return file_array
  #end
