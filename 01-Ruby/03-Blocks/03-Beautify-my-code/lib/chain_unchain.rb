def shuffle_word(a_word)
  #TODO: refactor this method
  a_word.upcase.chars.shuffle
end


def quote_prime_numbers(n)
  #TODO: refactor this method
  prime_numbers = (1..n).find_all do |i|
    selector = (2..i-1).select {|k| i % k == 0}
    selector.count == 0
  end

  prime_numbers.map { |prime_num| "#{prime_num} is prime" }
end