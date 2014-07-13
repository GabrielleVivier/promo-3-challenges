def shuffle(array)
  #TODO: shuffle array manually
  shuffled_array = []
  previous_random_index = nil
  until shuffled_array.size == array.size
    random_index = rand(array.size)
    if random_index == previous_random_index
    else
      shuffled_array << array[random_index]
    end
    previous_random_index = random_index
  end
  return shuffled_array
end


def shuffle2(array)
  #TODO: shuffle array manually
 return array.sort_by { |value, index| rand(index)}
end

print x = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print shuffle(x)
print x


