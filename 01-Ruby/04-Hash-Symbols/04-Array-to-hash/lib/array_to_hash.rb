def array_to_hash(array)
  #TODO: implement the method :)
  hash = Hash.new
  array.each_with_index do |element, index|
    if block_given?
      hash[yield(index)] = element
    else
      hash[index] = element
    end
  end
  return hash
end